import { UserRole } from "./user.types"

/**
 * Tipagem dos itens da lista de usuários.
 */
export interface UserListItem {
  /** ID do usuário. */
  uid: string
  /** Nome completo. */
  fullName: string
  /** E-mail do usuário. */
  email: string
  /** Papel do usuário. */
  role: UserRole
  /** Se o usuário está ativo ou não. */
  isActive: boolean
}
