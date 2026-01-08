/**
 * Modelo de dados para uma unidade escolar.
 */
export interface UnitModel {
  /** ID da unidade no Firestore. */
  id: string
  /** Nome da unidade. */
  name: string
}

/**
 * Modelo de dados para entrada de unidade escolar.
 * Exclui o campo `id`, que é gerado automaticamente pelo Firestore.
 */
export type UnitInputModel = Omit<UnitModel, "id">
