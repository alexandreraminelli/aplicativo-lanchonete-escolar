// Tipos básicos para usuários.

/**
 * Tipo de dados do ID do usuário.
 * Relativo ao UID do Firebase Authentication.
 */
export type UserId = string

/**
 * Papéis de usuários no sistema.
 *
 * Papéis disponíveis:
 * - **admin**: administrador do sistema. Responsável por gerenciar unidades e lanchonetes.
 * - **manager**: gerente da lanchonete. Responsável por gerenciar funcionários, produtos e pedidos.
 * - **employee**: funcionário da lanchonete. Responsável por preparar e entregar pedidos.
 * - **client**: usuário comum que realiza pedidos (aluno ou professor).
 */
export const USER_ROLES = ["admin", "manager", "employee", "client"] as const

/**
 * Tipos literais dos papéis de usuários no sistema.
 *
 * Papéis disponíveis:
 * - **admin**: administrador do sistema. Responsável por gerenciar unidades e lanchonetes.
 * - **manager**: gerente da lanchonete. Responsável por gerenciar funcionários, produtos e pedidos.
 * - **employee**: funcionário da lanchonete. Responsável por preparar e entregar pedidos.
 * - **client**: usuário comum que realiza pedidos (aluno ou professor).
 */
export type UserRole = (typeof USER_ROLES)[number]

/** Tipo de cliente: aluno ou professor. */
export type ClientType = "student" | "teacher"
