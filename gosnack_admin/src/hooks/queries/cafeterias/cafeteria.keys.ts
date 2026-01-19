/** Chaves de consulta para lanchonete no React Query. */
export const cafeteriaKeys = {
  /** Chave raiz para lanchonetes. */
  all: ["cafeterias"] as const,

  /** Chave para o escopo de lanchonetes por unidade. */
  byUnit: (unitId: string) => [...cafeteriaKeys.all, "unit", unitId] as const,

  /** Chave para a lista de lanchonetes por unidade. */
  listByUnit: (unitId: string) => [...cafeteriaKeys.byUnit(unitId), "list"] as const,

  /** Chave para uma lanchonete específica dentro de uma unidade. */
  detail: (unitId: string, cafeteriaId?: string) => [...cafeteriaKeys.byUnit(unitId), "detail", cafeteriaId] as const,
}
