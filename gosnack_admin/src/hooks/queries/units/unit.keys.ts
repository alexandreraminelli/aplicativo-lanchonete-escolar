/**
 * Chaves de consulta para unidades.
 */
export const unitKeys = {
  /** Chave raiz para unidades. */
  all: ["units"] as const, // chave raiz para unidades

  /** Chave para listas de unidades. */
  lists: () => [...unitKeys.all, "list"] as const, // chave para listas de unidades

  /** Chave para detalhes de uma unidade. */
  detail: (id?: string) => [...unitKeys.all, "detail", id] as const,
}
