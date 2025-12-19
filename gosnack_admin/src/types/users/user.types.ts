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
export type UserRole = "admin" | "manager" | "employee" | "client"

/** Tipo de cliente: aluno ou professor. */
export type ClientType = "student" | "teacher"
