import { required } from "node_modules/zod/v4/core/util.cjs"

/** Constantes de textos para lanchonetes. */
export const CAFETERIA_TEXTS = {
  management: "Gerenciar Lanchonetes",

  actions: {
    add: "Adicionar Lanchonete",
    edit: "Editar Lanchonete",
    delete: "Excluir Lanchonete",
  },

  confirm: {
    delete: {
      title: "Tem certeza que deseja excluir esta lanchonete?",
      message: (name: string) => `Tem certeza que deseja excluir a lanchonete "${name}"? Esta ação não pode ser desfeita.`,
    },

    empty: {
      title: "Nenhuma lanchonete encontrada",
      message: {
        p1: "Ainda não há lanchonetes cadastradas no sistema.",
        p2: "Clique no botão abaixo para adicionar a primeira lanchonete.",
      },
    },

    error: {
      create: "Não foi possível criar a lanchonete.",
      update: "Não foi possível salvar as alterações da lanchonete.",
      delete: "Não foi possível excluir a lanchonete.",

      getAll: "Não foi possível carregar as lanchonetes.",
      duplicateName: "Já existe uma lanchonete com este nome.",
    },

    loading: {
      creating: "Criando lanchonete...",
      updating: "Atualizando lanchonete...",
      deleting: "Excluindo lanchonete...",
    },
  },

  validation: {
    name: {
      required: "O nome da lanchonete é obrigatório.",
      min: "O nome da lanchonete deve ter no mínimo 5 caracteres.",
    },
    location: {
      required: "A localização da lanchonete é obrigatória.",
    },
  },
} as const
