import { Timestamp } from "firebase/firestore"
import { UserId, UserRole } from "./user.types"

/**
 * Interface base dos usuários do sistema.
 * Inclui os campos comuns a todos os tipos de usuários.
 */
export interface BaseUser {
  /** ID do usuário no Firestore. */
  id: UserId
  /** E-mail do usuário. */
  email: string

  /** Primeiro nome do usuário */
  firstName: string
  /** Sobrenome do usuário. */
  lastName: string

  /** Papel do usuário. */
  role: UserRole
  /** Se o usuário está ativo ou não. */
  isActive: boolean

  /** Data de criação da conta. */
  createdAt: Timestamp
  /** Data da última atualização dos dados do usuário. */
  updatedAt?: Timestamp
}
