import { UserRole } from "@/types/users/user.types"

/** Dados de entrada para criar uma conta. */
export interface SignUpInput {
  email: string
  password: string
  firstName: string
  lastName: string
  role: UserRole
}

/**
 * Dados de entrada para efetuar o login.
 */
export interface SignInInput {
  email: string
  password: string
}
