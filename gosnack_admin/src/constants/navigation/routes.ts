/** Strings de rotas da aplicação. */
export const ROUTES = {
  // Autenticação
  login: "/login",
  forgotPassword: "/recuperar-senha",

  // Visão Geral
  home: "/",

  // Unidades e Lanchonetes
  units: "/unidades",
  cafeterias: "/lanchonetes",

  // Usuários e Acessos
  users: "/usuarios",
  admins: `/usuarios/administradores`,
  managers: "/usuarios/gerentes",
  employees: "/usuarios/funcionários",
  permissions: "/usuarios/perfis-e-permissoes",
} as const
