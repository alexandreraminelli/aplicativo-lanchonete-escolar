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
    id: "ID da unidade",
  },

  validation: {
    name: "O nome da unidade deve ter pelo menos 5 caracteres.",
  },

  empty: {
    title: "Nenhuma unidade encontrada",
    message: {
      paragraph1: "Ainda não há unidades escolares cadastradas no sistema.",
      paragraph2: "Clique no botão abaixo para adicionar a primeira unidade.",
    },
  },

  loading: {
    creating: "Criando unidade...",
    updating: "Atualizando unidade...",
    deleting: "Excluindo unidade...",
  },

  success: {
    create: "Unidade criada com sucesso!",
    createDescription: (name: string) => `Unidade "${name}" foi criada com sucesso.`,

    update: "Unidade salva com sucesso!",
    updateDescription: (name: string) => `Unidade "${name}" atualizada com sucesso.`,
  },

  error: {
    getUnits: {
      title: "Não foi possível carregar as unidades.",
      message: "Tente novamente mais tarde.",
    },
    create: "Não foi possível criar a unidade.",
    duplicateName: {
      title: "Já existe uma unidade com esse nome.",
      description: (name: string) => `A unidade "${name}" já está cadastrada no sistema.`,
      message: "Já existe uma unidade com esse nome. Escolha um nome diferente.",
    },
    update: "Não foi possível atualizar a unidade.",
  },
} as const
