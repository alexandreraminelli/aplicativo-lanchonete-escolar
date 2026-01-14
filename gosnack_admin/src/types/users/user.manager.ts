import { DocumentReference } from "firebase/firestore"
import { BaseUser } from "./user.base"

/** Interface de dados para gerentes de lanchonetes. */
export interface ManagerUser extends BaseUser {
  role: "manager"

  /** Lanchonete gerenciada pelo gerente. */
  cafeteriaRef?: DocumentReference
}
