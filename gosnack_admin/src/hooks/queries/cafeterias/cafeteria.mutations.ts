import { CafeteriaRepository } from "@/lib/firebase/firestore/repositories/cafeteria.repository"
import { CafeteriaInputModel } from "@/types/domain/cafeteria.types"
import { useMutation, useQueryClient } from "@tanstack/react-query"
import { cafeteriaKeys } from "./cafeteria.keys"

/** Criar nova lanchonete e fazer refetch nas queries. */
export function useCreateCafeteria() {
  const queryClient = useQueryClient()

  return useMutation({
    mutationFn: ({ unitId, data }: { unitId: string; data: CafeteriaInputModel }) => CafeteriaRepository.create(unitId, data),

    onSuccess: (_, { unitId }) => {
      // Invalidar queries relacionadas para refetch
      queryClient.invalidateQueries({ queryKey: cafeteriaKeys.byUnit(unitId) })
    },
  })
}

/* TODO: Atualizar nome e descrição da lanchonete. */

/* TODO: Atualizar horários de funcionamento da lanchonete. */

/** Desativar lanchonete. */
export function useDeleteCafeteria() {
  const queryClient = useQueryClient()

  return useMutation({
    mutationFn: ({ unitId, cafeteriaId, isActive }: { unitId: string; cafeteriaId: string; isActive: boolean }) => CafeteriaRepository.setActiveStatus(unitId, cafeteriaId, isActive),

    onSuccess: (_, { unitId }) => {
      queryClient.invalidateQueries({ queryKey: cafeteriaKeys.byUnit(unitId) })
    },
  })
}
