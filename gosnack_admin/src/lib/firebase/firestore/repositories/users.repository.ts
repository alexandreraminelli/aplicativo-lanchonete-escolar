import { UserModel } from "@/types/users/user.model"
import { DocumentData, getDoc, getDocs, orderBy, query, QueryDocumentSnapshot } from "firebase/firestore"
import { firestorePaths } from "../paths"

/** Repositório para operações CRUD na coleção de unidades escolares. */
export class UserRepository {
  /** Referência da coleção de usuários. */
  private static get collectionRef() {
    return firestorePaths.users()
  }

  /** Busca todos os usuários. */
  static async findAll(): Promise<UserModel[]> {
    // Obter usuários e ordenar pelo nome
    const snapshot = await getDocs(query(this.collectionRef, orderBy("firstName", "asc")))

    return snapshot.docs.map(this.fromFirestore)
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
