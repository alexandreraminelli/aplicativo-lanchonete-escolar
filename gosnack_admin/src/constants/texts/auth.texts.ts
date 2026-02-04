import { UserRole } from "@/types/users/user.types"

/** Constantes de textos para autenticação. */
export const AUTH_TEXTS = {
  // Botões de ação
  actions: {
    forgotPassword: "Esqueceu a senha?",
    password: {
      hide: "Ocultar senha",
      show: "Mostrar senha",
    },
    signOut: "Sair",
    submit: {
      login: "Entrar",
      signUp: "Criar Usuário",
    },
  },

  // Formato do e-mail
  emailFormat: "nome.sobrenome@colegioipsum.edu.br",

  // Mensagens de erro sem detalhes
  error: {
    title: "Erro na Autenticação",
    signIn: "Ocorreu um erro e não foi possível realizar o login. Tente novamente mais tarde.",
    signUp: "Ocorreu um erro e não foi possível criar o novo usuário. Tente novamente mais tarde.",
  },

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
    status: { label: "Status", active: "Ativo", inactive: "Desativado" },
  },

  // Papeis do usuário
  roles: {
    client: "Cliente",
    employee: "Funcionário da Lanchonete",
    manager: "Gerente de Lanchonete",
    admin: "Administrador",
  } satisfies Record<UserRole, string>,

  // Cabeçalho do login
  loginHeader: {
    loginTitle: "GoSnack: Painel de Controle",
    loginSubtitle: "Acesse o sistema para gerenciar pedidos e produtos.",
  },

  // Operação bem-sucedida
  success: {
    signIn: "Login realizado com sucesso! Bem-vindo de volta.",
    signUp: "Usuário criado com sucesso!",
  },

  // Mensagens de validação
  validation: {
    email: {
      required: "O e-mail é obrigatório.",
    },
    name: {
      firstName: {
        required: "O nome é obrigatório.",
      },
      lastName: {
        required: "O sobrenome é obrigatório.",
      },
    },
    password: {
      required: "A senha é obrigatória.",

      digit: "A senha deve conter pelo menos um número.",
      length: "A senha deve ter pelo menos 8 caracteres.",
      specialChar: "A senha deve conter pelo menos um caractere especial.",

      lowerCase: "A senha deve conter letras minúsculas.",
      upperCase: "A senha deve conter letras maiúsculas.",
    },

    role: {
      required: "Selecione um tipo de usuário.",
    },
  },
} as const
