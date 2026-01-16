import { AUTH_TEXTS } from "@/constants/texts/auth.texts"
import { auth } from "@/lib/firebase/clientApp"
import { AuthError, signInWithEmailAndPassword, signOut } from "firebase/auth"
import { SignInInput } from "./authInput.types"
import { getAuthErrorMessage } from "./errors/get-auth-error-message"

/**
 * Verifica o e-mail e senha fornecidos e realiza a autenticação do usuário.
 */
export async function signInUser({ email, password }: SignInInput) {
  try {
    // Efetuar autenticação no Auth
    const userCredential = await signInWithEmailAndPassword(auth, email, password)

    // Retornar sucesso e UID do usuário
    return { success: true, userId: userCredential.user.uid }
  } catch (error) {
    // Retornar mensagem de erro
    const message = getAuthErrorMessage(error as AuthError, AUTH_TEXTS.error.signIn)
    return { success: false, message: message }
  }
}

/**
 * Desconecta o usuário atualmente autenticado.
 */
export async function signOutUser() {
  await signOut(auth)
}
