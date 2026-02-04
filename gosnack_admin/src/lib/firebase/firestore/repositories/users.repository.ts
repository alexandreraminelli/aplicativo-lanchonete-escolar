import { UserModel } from "@/types/users/user.model"
import { DocumentData, getDoc, getDocs, orderBy, query, QueryDocumentSnapshot } from "firebase/firestore"
import { firestorePaths } from "../paths"
import { UserListItem } from "@/types/users/user.list-item"
import { auth } from "@/lib/firebase/clientApp"

/** Repositório para operações CRUD na coleção de unidades escolares. */
export class UserRepository {
  /** Referência da coleção de usuários. */
  private static get collectionRef() {
    return firestorePaths.users()
  }

  /**
   * Busca todos os usuários usando Admin SDK via API Route.
   * Combina dados do Firebase Auth com dados do Firestore.
   *
   * @returns Lista de usuários em uma tipagem adequada para listagem em tabelas.
   */
  static async findAll(): Promise<UserListItem[]> {
    const currentUser = auth.currentUser

    if (!currentUser) {
      throw new Error("Usuário não autenticado")
    }

    const token = await currentUser.getIdToken()

    // Chamar API Route que usa Admin SDK
    const response = await fetch("/api/users", {
      headers: {
        Authorization: `Bearer ${token}`,
      },
    })

    if (!response.ok) {
      throw new Error("Erro ao buscar usuários")
    }

    return response.json()
  }

  /** Converter documento do Firestore em `UserModel`. */
  private static fromFirestore(snapshot: QueryDocumentSnapshot<DocumentData> | Awaited<ReturnType<typeof getDoc>>): UserModel {
    const data = snapshot.data() as Omit<UserModel, "id">

    if (!data) {
      throw new Error("Document data does not exist")
    }

    return {
      id: snapshot.id,
      ...data,
    } as UserModel
  }
}
