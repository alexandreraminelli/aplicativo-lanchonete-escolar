import { onCall, HttpsError } from "firebase-functions/v2/https"
import { getAuth } from "firebase-admin/auth"

import "../lib/firebase-admin"
import { FieldValue, getFirestore } from "firebase-admin/firestore"

/**
 * Cloud Function para criar um novo usuário via Firebase Admin SDK.
 */
export const createUser = onCall(async (request) => {
  const { auth, data } = request

  // Verificar autenticação
  if (!auth) {
    throw new HttpsError("unauthenticated", "Usuário não autenticado.")
  }

  const requesterUid = auth.uid
  const db = getFirestore()

  // Verificar se o usuário solicitante é admin
  const requesterSnap = await db.doc(`users/${requesterUid}`).get()

  if (!requesterSnap.exists || requesterSnap.data()?.role !== "admin") {
    throw new HttpsError("permission-denied", "Usuário não tem permissão para criar novos usuários.")
  }

  // Validar dados de entrada
  const { email, password, firstName, lastName, role } = data

  if (!email || !password || !firstName || !lastName || !role) {
    throw new HttpsError("invalid-argument", "Dados obrigatórios ausentes.")
  }

  // Criar novo usuário no Auth
  const authInstance = getAuth()

  const userRecord = await authInstance.createUser({
    email,
    password,
    displayName: `${firstName} ${lastName}`.trim(),
    disabled: false,
  })

  // Criar documento no Firestore
  await db.doc(`users/${userRecord.uid}`).set({
    email,
    firstName,
    lastName,
    role,
    createdBy: requesterUid,
    createdAt: FieldValue.serverTimestamp(),
    updatedAt: FieldValue.serverTimestamp(),
  })

  //   Retornar sucesso e UID do novo usuário
  return { success: true, userId: userRecord.uid }
})
