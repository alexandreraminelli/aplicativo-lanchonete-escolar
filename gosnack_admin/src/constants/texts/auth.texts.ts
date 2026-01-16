import { UserRole } from "@/types/users/user.types"

/** Constantes de textos para autenticação. */
export const AUTH_TEXTS = {
  // Campos do usuário.
  fields: {
    // Nome e sobrenome
    firstName: "Primeiro nome",
    lastName: "Sobrenome",
    fullName: "Nome completo",

    // Credenciais
    email: "E-mail",
    password: "Senha",

    // Informações adicionais
    role: "Tipo de usuário",
    status: { label: "Status", active: "Ativo", inactive: "Inativo" },
  },

  /* Formato do e-mail */
  emailFormat: "nome.sobrenome@colegioipsum.edu.br",

  /* Papéis dos usuários */
  roles: {
    client: "Cliente",
    employee: "Funcionário da Lanchonete",
    manager: "Gerente de Lanchonete",
    admin: "Administrador",
  } satisfies Record<UserRole, string>,

  /* Botões de ação */
  forgotPassword: "Esqueceu a senha?",
  loginSubmit: "Entrar",
  signUpSubmit: "Criar Conta",

  hidePassword: "Ocultar senha",
  showPassword: "Mostrar senha",

  signOut: "Sair",

  myAccount: "Minha Conta",

  /* Login Page */
  loginTitle: "GoSnack: Painel de Controle",
  loginSubtitle: "Acesse o sistema para gerenciar pedidos e produtos.",

  /* Mensagens de validação. */
  firstNameRequired: "O nome é obrigatório.",
  lastNameRequired: "O sobrenome é obrigatório.",
  emailRequired: "O e-mail é obrigatório.",
  roleRequired: "Selecione um tipo de usuário.",

  passwordRequired: "A senha é obrigatória.",
  passwordLength: "A senha deve ter pelo menos 8 caracteres.",
  passwordCase: "A senha deve conter letras maiúsculas e minúsculas.",
  passwordDigit: "A senha deve conter pelo menos um número.",
  passwordSpecialChar: "A senha deve conter pelo menos um caractere especial.",

  /* Mensagens de operações bem-sucedida. */
  signUpSuccess: "Conta criada com sucesso! Essa conta já pode ser usada para fazer login.",
  signInSuccess: "Login realizado com sucesso!",

  /* Mensagens de erro genéricas */
  errorTitle: "Erro na Autenticação",
  signUpError: "Ocorreu um erro e não foi possível criar a conta. Tente novamente mais tarde.",
  signInError: "Ocorreu um erro e não foi possível realizar o login. Tente novamente mais tarde.",
} as const
