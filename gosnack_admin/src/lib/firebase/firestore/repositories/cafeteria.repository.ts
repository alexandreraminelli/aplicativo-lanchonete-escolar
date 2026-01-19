import { CafeteriaInputModel, CafeteriaModel } from "@/types/domain/cafeteria.types"
import { addDoc, doc, DocumentData, getDoc, getDocs, orderBy, query, QueryDocumentSnapshot, Timestamp, updateDoc, where } from "firebase/firestore"
import { firestorePaths } from "../paths"

/** Repositório para operações CRUD na subcoleção de lanchonetes no Firestore. */
export class CafeteriaRepository {
  /** Referência da subcoleção de lanchonetes de uma unidade escolar. */
  private static collectionRef(unitId: string) {
    return firestorePaths.cafeterias(unitId)
  }

  /** Converter documento do Firestore em `CafeteriaModel`. */
  private static fromFirestore(snapshot: QueryDocumentSnapshot<DocumentData> | Awaited<ReturnType<typeof getDoc>>): CafeteriaModel {
    const data = snapshot.data() as Omit<CafeteriaModel, "id">

    return {
      id: snapshot.id,
      ...data,
    }
  }

  /** Cria um novo documento de lanchonete dentro de uma unidade. */
  static async create(unitId: string, data: CafeteriaInputModel): Promise<CafeteriaModel> {
    const now = Timestamp.now() // obter tempo atual

    // Montar objeto
    const cafeteriaData = {
      name: data.name,
      location: data.location,
      phones: data.phones ?? [],
      openingHours: data.openingHours,

      isActive: true,
    } satisfies CafeteriaInputModel

    // Adicionar documento à subcoleção
    const docRef = await addDoc(this.collectionRef(unitId), cafeteriaData)

    // Retornar o documento criado com o ID gerado
    return {
      id: docRef.id,
      createdAt: now,
      updatedAt: now,
      ...cafeteriaData,
    }
  }

  /** Obtêm uma lanchonete com base no seu ID e ID da unidade. */
  static async findById(unitId: string, cafeteriaId: string): Promise<CafeteriaModel | null> {
    const docRef = doc(this.collectionRef(unitId), cafeteriaId)
    const snapshot = await getDoc(docRef)

    // Se não existir
    if (!snapshot.exists()) return null

    // Retornar a lanchonete encontrada
    return this.fromFirestore(snapshot)
  }

  /** Obter uma lista de todas as lanchonetes de uma unidade. */
  static async findAllByUnit(unitId: string): Promise<CafeteriaModel[]> {
    const snapshot = await getDocs(query(this.collectionRef(unitId), orderBy("name", "asc")))

    return snapshot.docs.map(this.fromFirestore)
  }

  /** Busca uma lanchonete dentro de uma unidade pelo nome. */
  static async findByNameInUnit(unitId: string, name: string): Promise<CafeteriaModel | null> {
    const snapshot = await getDocs(query(this.collectionRef(unitId), where("name", "==", name)))

    if (snapshot.empty) return null // se não encontrar o nome

    return this.fromFirestore(snapshot.docs[0])
  }

  /** Atualizar o documento de uma lanchonete. */
  static async update(unitId: string, cafeteriaId: string, data: Partial<Omit<CafeteriaInputModel, "createdAt" | "isActive">>): Promise<void> {
    const docRef = doc(this.collectionRef(unitId), cafeteriaId)
    await updateDoc(docRef, { ...data, updatedAt: Timestamp.now() })
  }

  /**
   * Atualizar status de ativação da lanchonete (soft-delete).
   *
   * @param isActive Novo status de ativação.
   */
  static async setActiveStatus(unitId: string, cafeteriaId: string, isActive: boolean): Promise<void> {
    const docRef = doc(this.collectionRef(unitId), cafeteriaId)

    await updateDoc(docRef, { isActive: isActive, updatedAt: Timestamp.now() })
  }
}
