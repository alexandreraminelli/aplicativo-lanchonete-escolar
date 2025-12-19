import { DocumentReference } from "firebase/firestore"
import { BaseUser } from "./user.base"

/** Interface de dados para funcionários de uma lanchonete. */
export interface EmployeeUser extends BaseUser {
  role: "employee"

  /** Lanchonete onde o funcionário trabalha. */
  snackBarRef: DocumentReference
}
