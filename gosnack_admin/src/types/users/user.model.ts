import { AdminUser } from "./user.admin"
import { ClientUser } from "./user.client"
import { EmployeeUser } from "./user.employee"
import { ManagerUser } from "./user.manager"

/**
 * Modelo de dados do usuário.
 * Usa union types para representar os diferentes tipos de usuários do sistema.
 */
export type UserModel = AdminUser | ManagerUser | EmployeeUser | ClientUser
