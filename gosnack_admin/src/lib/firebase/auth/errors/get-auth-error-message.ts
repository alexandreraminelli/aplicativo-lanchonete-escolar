import { AUTH_ERROR_MESSAGES } from "@/src/constants/texts/auth-errors.texts"
import { AUTH_TEXTS } from "@/src/constants/texts/auth.texts"
import { AuthError } from "firebase/auth"

/**
 * Obtém a mensagem de erro apropriada para um erro de autenticação do Firebase.
 */
export function getAuthErrorMessage(error: unknown, defaultMessage: string): string {
  if (!error || typeof error !== "object" || !("code" in error)) {
    return defaultMessage
  }

  const authError = error as AuthError
  return AUTH_ERROR_MESSAGES[authError.code as keyof typeof AUTH_ERROR_MESSAGES] ?? defaultMessage
}
