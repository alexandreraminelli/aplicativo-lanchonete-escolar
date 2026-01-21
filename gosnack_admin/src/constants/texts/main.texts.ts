/** Constantes de textos principais do app. */
export const MAIN_TEXTS = {
  // Nome do aplicativo
  appName: "GoSnack Admin",
  collegeName: "Colégio Logoipsum",

  // Acesso negado
  accessDenied: {
    title: "Acesso Negado",
    message: {
      paragraph1: "Você não tem permissão para acessar esta página.",
      paragraph2: "Se você acredita que isso é um erro, entre em contato com o administrador do sistema.",
    },
  },

  // Botões de ação
  actions: {
    create: "Criar",
    edit: "Editar",
    delete: "Excluir",
    cancel: "Cancelar",
    save: "Salvar",

    backToHome: "Voltar para Início",
  },

  // Entidades
  entities: {
    cafeteria: "Lanchonete",
    cafeterias: "Lanchonetes",

    schoolUnit: "Unidade Escolar",
    schoolUnits: "Unidades Escolares",
    unit: "Unidade",
    units: "Unidades",

    user: "Usuário",
    users: "Usuários",
  },

  // Erros
  error: {
    tryAgain: "Tente novamente mais tarde.",
  },

  // Campos comuns
  fields: {
    id: "ID",
    name: "Nome",
    description: "Descrição",
    status: "Status",

    createdAt: "Criado em",
    updatedAt: "Atualizado em",
  },

  // Página 404
  notFound: {
    title: "404: Página Não Encontrada",
    message: {
      paragraph1: "Desculpe, a página que você está tentando acessar não existe.",
      paragraph2: "Verifique se o endereço está correto ou volte para a página inicial.",
    },
  },

  // Opções de tema
  theme: {
    light: "Claro",
    dark: "Escuro",
    system: "Sistema",
  },
} as const
