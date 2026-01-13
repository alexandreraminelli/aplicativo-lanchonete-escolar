import { collection } from "firebase/firestore"
import { firestore } from "../clientApp"
import { FirestoreRootCollections, FirestoreSubCollections } from "./collections"

/**
 * Objetos que representam os caminhos das coleções e subcoleções no Firestore.
 */
export const firestorePaths = {
  // Coleções principais:
  categories: () => collection(firestore, FirestoreRootCollections.CATEGORIES),
  dietaryRestrictions: () => collection(firestore, FirestoreRootCollections.DIETARY_RESTRICTIONS),
  ingredients: () => collection(firestore, FirestoreRootCollections.INGREDIENTS),
  orders: () => collection(firestore, FirestoreRootCollections.ORDERS),
  units: () => collection(firestore, FirestoreRootCollections.UNITS),
  users: () => collection(firestore, FirestoreRootCollections.USERS),

  // Subcoleções:

  /** Instância da subcoleção de lanchonetes de uma unidade escolar específica. */
  cafeterias: (unitId: string) => collection(firestore, FirestoreRootCollections.UNITS, unitId, FirestoreSubCollections.CAFETERIAS),

  /** Instância da subcoleção de produtos de uma lanchonete específica. */
  products: (unitId: string, cafeteriaId: string) => collection(firestore, FirestoreRootCollections.UNITS, unitId, FirestoreSubCollections.CAFETERIAS, cafeteriaId, FirestoreSubCollections.PRODUCTS),
}
