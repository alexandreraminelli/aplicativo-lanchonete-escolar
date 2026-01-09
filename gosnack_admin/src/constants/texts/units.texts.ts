/** Constantes de textos para gerenciamento de unidades escolares. */
export const UNITS_TEXTS = {
  mainPage: {
    title: "Gerenciar Unidades",
  },

  actions: {
    add: "Adicionar Unidade",
    edit: "Editar Unidade",
    delete: "Excluir Unidade",
  },

  placeholder: {
    name: "Ex: Santo André, São Bernardo do Campo - Rudge Ramos",
  },

  fields: {
    name: "Nome da unidade",
  },

  validation: {
    name: "O nome da unidade deve ter pelo menos 5 caracteres.",
  },

  success: {
    create: "Unidade criada com sucesso!",
    update: "Unidade salva com sucesso!",
  },

  error: {
    getUnits: {
      title: "Não foi possível carregar as unidades.",
      message: "Tente novamente mais tarde.",
    },
    createUnit: "Não foi possível criar a unidade.",
  },
} as const
