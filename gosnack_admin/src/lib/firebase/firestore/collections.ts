/** Constantes de nomes de coleções raízes do Firestore. */
export const FirestoreRootCollections = {
  /** Coleção de categorias. */
  CATEGORIES: "categories",

  /** Coleção de restrições alimentares. */
  DIETARY_RESTRICTIONS: "dietaryRestrictions",

  /** Coleção de ingredientes. */
  INGREDIENTS: "ingredients",

  /** Coleção de pedidos realizados. */
  ORDERS: "orders",

  /** Coleção de unidades escolares. */
  UNITS: "units",

  /** Coleção de informações dos usuários. */
  USERS: "users",
} as const

/** Constantes de nomes de subcoleções no Firestore. */
export const FirestoreSubCollections = {
  // Subcoleções de "units/{unitId}/..."

  /** Coleção de produtos e pratos do cardápio. */
  PRODUCTS: "products",

  /** Coleção de lanchonetes. */
  SNACK_BARS: "snackBars",
} as const
