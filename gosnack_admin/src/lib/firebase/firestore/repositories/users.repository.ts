import { UserModel } from "@/types/users/user.model"
import { DocumentData, getDoc, getDocs, orderBy, query, QueryDocumentSnapshot } from "firebase/firestore"
import { firestorePaths } from "../paths"
import { UserListItem } from "@/types/users/user.list-item"

/** Repositório para operações CRUD na coleção de unidades escolares. */
export class UserRepository {
  /** Referência da coleção de usuários. */
  private static get collectionRef() {
    return firestorePaths.users()
  }

  /**
   * Busca todos os usuários.
   *
   * @returns Lista de usuários em uma tipagem adequada para listagem em tabelas.
   */
  static async findAll(): Promise<UserListItem[]> {
    // Obter usuários e ordenar pelo nome
    const snapshot = await getDocs(query(this.collectionRef, orderBy("firstName", "asc")))

    return snapshot.docs.map((doc) => {
      const data = doc.data() as UserModel

      return {
        uid: doc.id,
        fullName: `${data.firstName} ${data.lastName}`.trim(),
        email: data.email,
        role: data.role,
        isActive: data.isActive,
      }
    })
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
