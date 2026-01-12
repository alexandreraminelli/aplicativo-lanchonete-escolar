import { firestore } from "@/lib/firebase/clientApp"
import { FirestoreCollections } from "@/lib/firebase/firestore/collections"
import { UnitModel } from "@/types/domain/unit.types"
import { addDoc, collection, deleteDoc, doc, DocumentData, getDoc, getDocs, orderBy, query, QueryDocumentSnapshot, updateDoc, where } from "firebase/firestore"

/** Repositório para operações CRUD na coleção de unidades escolares. */
export class UnitRepository {
  /** Referência da coleção de unidades. */
  private static collectionRef = collection(firestore, FirestoreCollections.UNITS)

  /** Cria um novo documento de unidade escolar no Firestore. */
  static async create(data: Omit<UnitModel, "id">) {
    // Adicionar o documento à coleção
    const docRef = await addDoc(this.collectionRef, { name: data.name })
    // Retornar o documento criado com o ID gerado
    return {
      id: docRef.id,
      name: data.name,
    }
  }

  /** Busca uma unidade escolar no Firestore pelo ID. */
  static async findById(id: string): Promise<UnitModel | null> {
    const docRef = doc(this.collectionRef, id)
    const snapshot = await getDoc(docRef)

    // Se não existir
    if (!snapshot.exists()) return null

    // Retornar a unidade encontrada
    return this.fromFirestore(snapshot)
  }

  /** Obtém uma lista de todas as unidades escolares. */
  static async findAll(): Promise<UnitModel[]> {
    // Obter unidade e ordenar pelo nome
    const snapshot = await getDocs(query(this.collectionRef, orderBy("name", "asc")))

    return snapshot.docs.map(this.fromFirestore)
  }

  /** Busca uma unidade no Firestore pelo atributo `name`. */
  static async findByName(name: string): Promise<UnitModel | null> {
    const snapshot = await getDocs(query(this.collectionRef, where("name", "==", name)))

    if (snapshot.empty) return null // se não encontrar o nome

    return this.fromFirestore(snapshot.docs[0])
  }

  /** Atualiza o documento de uma unidade no Firestore. */
  static async update(id: string, data: Partial<Omit<UnitModel, "id">>): Promise<void> {
    const docRef = doc(this.collectionRef, id)
    await updateDoc(docRef, data)
  }

  /** Remove o documento de uma unidade no Firestore. */
  static async delete(id: string): Promise<void> {
    const docRef = doc(this.collectionRef, id)
    await deleteDoc(docRef)
  }

  /** Converter documento do Firestore em `UnitModel`. */
  private static fromFirestore(snapshot: QueryDocumentSnapshot<DocumentData> | Awaited<ReturnType<typeof getDoc>>): UnitModel {
    const data = snapshot.data() as Omit<UnitModel, "id">

    return {
      id: snapshot.id,
      name: data.name,
    }
  }
}
