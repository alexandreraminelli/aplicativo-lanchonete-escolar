import { AUTH_TEXTS } from "@/constants/texts/auth.texts"
import { auth, firestore } from "@/lib/firebase/clientApp"
import { UserModel } from "@/types/users/user.model"
import { AuthError, createUserWithEmailAndPassword, signInWithEmailAndPassword, signOut, updateProfile } from "firebase/auth"
import { doc, setDoc, Timestamp } from "firebase/firestore"
import { FirestoreRootCollections } from "../firestore/collections"
import { SignInInput, SignUpInput } from "./authInput.types"
import { getAuthErrorMessage } from "./errors/get-auth-error-message"

/**
 * Registra um novo usuário no Firebase Authentication e cria seu documento no Firestore.
 */
export async function signUpUser({ email, password, firstName, lastName, role }: SignUpInput) {
  try {
    // Criar usuário no Firebase Auth
    const userCredential = await createUserWithEmailAndPassword(auth, email, password)

    // Atualizar displayName
    await updateProfile(userCredential.user, { displayName: `${firstName} ${lastName}`.trim() })

    // Criar documento do usuário no Firestore
    await setDoc(
      doc(
        firestore, // instância do serviço Firestore
        FirestoreRootCollections.USERS, // nome da coleção
        userCredential.user.uid // UID do documento
      ),
      // Dados a serem salvos:
      {
        firstName,
        lastName,
        role,
        email,
        createdAt: Timestamp.now(),
        isActive: true,
      } as UserModel
    )

    // Retornar sucesso e UID novo usuário
    return { success: true, userId: userCredential.user.uid }
  } catch (error) {
    // Retornar mensagem de erro
    const message = getAuthErrorMessage(error as AuthError, AUTH_TEXTS.signUpError)
    return { success: false, message: message }
  }
}

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
    const message = getAuthErrorMessage(error as AuthError, AUTH_TEXTS.signInError)
    return { success: false, message: message }
  }
}

/**
 * Desconecta o usuário atualmente autenticado.
 */
export async function signOutUser() {
  await signOut(auth)
}
