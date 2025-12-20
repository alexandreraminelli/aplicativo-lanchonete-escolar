import { AUTH_TEXTS } from "@/src/constants/texts/auth.texts"
import { auth, firestore } from "@/src/lib/firebase/clientApp"
import { UserModel } from "@/src/types/users/user.model"
import { createUserWithEmailAndPassword, signInWithEmailAndPassword, updateProfile } from "firebase/auth"
import { doc, setDoc, Timestamp } from "firebase/firestore"
import { FirestoreCollections } from "../firestore/collections"
import { SignInInput, SignUpInput } from "./authInput.types"

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
        FirestoreCollections.USERS, // nome da coleção
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
  } catch {
    // Retornar mensagem de erro
    return { success: false, message: AUTH_TEXTS.signUpError }
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
  } catch {
    // Retornar mensagem de erro
    return { success: false, message: AUTH_TEXTS.signInError }
  }
}
