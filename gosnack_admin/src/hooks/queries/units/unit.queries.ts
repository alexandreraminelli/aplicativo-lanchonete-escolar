import { useQuery } from "@tanstack/react-query"
import { unitKeys } from "./unit.keys"
import { UnitRepository } from "@/lib/firebase/firestore/repositories/unit.repository"

/** Hook para buscar todas as unidades. */
export function useUnits() {
  return useQuery({
    queryKey: unitKeys.lists(),
    queryFn: () => UnitRepository.findAll(),
  })
}

/** Hook para buscar uma unidade específica pelo ID. */
export function useUnit(unitId?: string) {
  return useQuery({
    queryKey: unitKeys.detail(unitId),
    queryFn: () => UnitRepository.findById(unitId!),
    enabled: !!unitId, // só executa se o unitId estiver definido
  })
}

/**
 * Hook para verificar se já existe uma unidade com o mesmo nome.
 *
 * @param name Nome da unidade a ser verificada.
 * @param excludeId ID da unidade a ser excluída da verificação (para edições).
 */
export function useCheckUnitName(name: string, excludeId?: string) {
  return useQuery({
    queryKey: ["unit", "checkName", name],
    queryFn: async () => {
      // Se não houver nome
      if (!name.trim()) return null

      // Buscar unidade pelo nome
      const existing = await UnitRepository.findByName(name)

      // Se existir e não for a própria unidade sendo editada
      if (existing && existing.id !== excludeId) {
        return existing // Tem unidade com mesmo nome
      } else {
        return null // Não tem unidade com mesmo nome
      }
    },
    enabled: !!name.trim(), // só executa se o nome não estiver vazio
    staleTime: 1000 * 60 * 5, // Cache por 5 minutos
  })
}
