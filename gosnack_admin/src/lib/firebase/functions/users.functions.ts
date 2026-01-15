import { httpsCallable } from "firebase/functions"
import { SignUpInput } from "../auth/authInput.types"
import { functions } from "../clientApp"

/** Chamada a Cloud Function para um admin criar um novo usuário. */
export const createUser = async (payload: SignUpInput) => {
  const callable = httpsCallable(functions, "createUser")
  const result = await callable(payload)
  return result.data as { success: boolean; userId?: string; message?: string }
}
