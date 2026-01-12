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
    unit: "Unidade",
    units: "Unidades",

    snackBar: "Lanchonete",
    snackBars: "Lanchonetes",
  },

  id: "ID",

  // Página 404
  notFound: {
    title: "404: Página Não Encontrada",
    message: {
      paragraph1: "Desculpe, a página que você está tentando acessar não existe.",
      paragraph2: "Verifique se o endereço está correto ou volte para a página inicial.",
    },
  },

  theme: {
    light: "Claro",
    dark: "Escuro",
    system: "Sistema",
  },
} as const
