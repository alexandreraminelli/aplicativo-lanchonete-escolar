import { DocumentReference } from "firebase/firestore"
import { BaseUser } from "./user.base"

/** Interface de dados para usuários do tipo "cliente". */
export interface ClientUser extends BaseUser {
  role: "client"

  /** Tipo de cliente: aluno ou professor. */
  clientType: "student" | "teacher"

  /** Unidade escolar do aluno/professor. */
  schoolUnitRef: DocumentReference
}
