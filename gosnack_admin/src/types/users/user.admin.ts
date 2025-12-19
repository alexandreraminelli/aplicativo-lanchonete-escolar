import { BaseUser } from "./user.base"

/** Interface de dados para administradores do sistema. */
export interface AdminUser extends BaseUser {
  role: "admin"
}
