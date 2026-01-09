import { UnitRepository } from "@/lib/firebase/firestore/repositories/unit.repository"
import { UnitModel } from "@/types/domain/unit.types"
import { useMutation, useQueryClient } from "@tanstack/react-query"
import { unitKeys } from "./unit.keys"

/** Criar unidade. */
export function useCreateUnit() {
  const queryClient = useQueryClient()

  return useMutation({
    mutationFn: (data: Omit<UnitModel, "id">) => UnitRepository.create(data),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: unitKeys.all }) // Invalida as queries relacionadas a unidades para refetch
    },
  })
}

/** Atualizar unidade. */
export function useUpdateUnit() {
  const queryClient = useQueryClient()

  return useMutation({
    mutationFn: ({ id, data }: { id: string; data: Partial<Omit<UnitModel, "id">> }) => UnitRepository.update(id, data),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: unitKeys.all })
    },
  })
}

/** Deletar unidade. */
export function useDeleteUnit() {
  const queryClient = useQueryClient()

  return useMutation({
    mutationFn: (id: string) => UnitRepository.delete(id),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: unitKeys.all })
    },
  })
}
