import { initializeApp, getApps, cert } from "firebase-admin/app"
import { getAuth } from "firebase-admin/auth"
import { getFirestore } from "firebase-admin/firestore"
import { NextResponse } from "next/server"
import { UserListItem } from "@/types/users/user.list-item"
import { UserModel } from "@/types/users/user.model"

// Inicializar Admin SDK (apenas uma vez)
if (getApps().length === 0) {
  initializeApp({
    credential: cert({
      projectId: process.env.FIREBASE_ADMIN_PROJECT_ID,
      clientEmail: process.env.FIREBASE_ADMIN_CLIENT_EMAIL,
      privateKey: process.env.FIREBASE_ADMIN_PRIVATE_KEY?.replace(/\\n/g, "\n"),
    }),
  })
}

const auth = getAuth()
const db = getFirestore()

/**
 * GET /api/users
 * Lista todos os usuários do Firebase Auth com dados complementares do Firestore.
 */
export async function GET(request: Request) {
  try {
    const authHeader = request.headers.get("authorization")

    if (!authHeader || !authHeader.startsWith("Bearer ")) {
      return NextResponse.json({ error: "Não autorizado" }, { status: 401 })
    }

    const idToken = authHeader.replace("Bearer ", "").trim()
    const decodedToken = await auth.verifyIdToken(idToken)

    const requesterSnap = await db.collection("users").doc(decodedToken.uid).get()

    if (!requesterSnap.exists || requesterSnap.data()?.role !== "admin") {
      return NextResponse.json({ error: "Sem permissão" }, { status: 403 })
    }

    const users: UserListItem[] = []
    let pageToken: string | undefined

    // Listar todos os usuários do Auth (com paginação)
    do {
      const listUsersResult = await auth.listUsers(1000, pageToken)

      // Para cada usuário do Auth, buscar dados do Firestore
      const usersWithFirestoreData = await Promise.all(
        listUsersResult.users.map(async (userRecord) => {
          try {
            // Buscar dados complementares do Firestore
            const userDoc = await db.collection("users").doc(userRecord.uid).get()
            const firestoreData = userDoc.data() as UserModel | undefined

            return {
              uid: userRecord.uid,
              email: userRecord.email || "",
              fullName: firestoreData ? `${firestoreData.firstName} ${firestoreData.lastName}`.trim() : userRecord.displayName || "",
              role: firestoreData?.role || "client",
              isActive: !userRecord.disabled, // disabled = false significa ativo
              emailVerified: userRecord.emailVerified,
              createdAt: userRecord.metadata.creationTime,
              lastSignIn: userRecord.metadata.lastSignInTime,
            } as UserListItem
          } catch (error) {
            console.error(`Erro ao buscar dados do Firestore para ${userRecord.uid}:`, error)

            // Retornar apenas dados do Auth se houver erro
            return {
              uid: userRecord.uid,
              email: userRecord.email || "",
              fullName: userRecord.displayName || "",
              role: "client",
              isActive: !userRecord.disabled,
              emailVerified: userRecord.emailVerified,
              createdAt: userRecord.metadata.creationTime,
              lastSignIn: userRecord.metadata.lastSignInTime,
            } as UserListItem
          }
        }),
      )

      users.push(...usersWithFirestoreData)
      pageToken = listUsersResult.pageToken
    } while (pageToken)

    // Ordenar por nome
    users.sort((a, b) => a.fullName.localeCompare(b.fullName))

    return NextResponse.json(users)
  } catch (error) {
    console.error("Erro ao listar usuários:", error)
    return NextResponse.json({ error: "Erro ao listar usuários" }, { status: 500 })
  }
}
