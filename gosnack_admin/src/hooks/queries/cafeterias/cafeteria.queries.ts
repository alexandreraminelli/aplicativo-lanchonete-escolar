import { CafeteriaRepository } from "@/lib/firebase/firestore/repositories/cafeteria.repository"
import { useQuery } from "@tanstack/react-query"
import { cafeteriaKeys } from "./cafeteria.keys"

/** Hook para buscar todas as lanchonetes de uma unidade. */
export function useCafeterias(unitId?: string) {
  return useQuery({
    queryKey: cafeteriaKeys.listByUnit(unitId!), // chave para a lista de lanchonetes por unidade

    queryFn: () => CafeteriaRepository.findAllByUnit(unitId!), // realizar busca

    enabled: !!unitId, // só executa se o unitId estiver definido
  })
}

/** Hook para buscar uma lanchonete específica pelo ID da unidade e lanchonete. */
export function useCafeteria(unitId?: string, cafeteriaId?: string) {
  return useQuery({
    queryKey: cafeteriaKeys.detail(unitId!, cafeteriaId),

    queryFn: () => CafeteriaRepository.findById(unitId!, cafeteriaId!),

    enabled: !!unitId && !!cafeteriaId,
  })
}

/**
 * Hook para verificar se já existe uma lanchonete com o mesmo nome dentro de uma unidade.
 *
 * @param unitId ID da unidade escolar.
 * @param name Nome da lanchonete a ser verificada.
 * @param excludeId ID da lanchonete a ser excluída da verificação (para edições).
 */
export function useCheckCafeteriaName(unitId: string, name: string, excludeId?: string) {
  return useQuery({
    queryKey: ["cafeteria", "checkName", name],

    queryFn: async () => {
      if (!name.trim()) return null // Se não houver nome

      const existing = await CafeteriaRepository.findByNameInUnit(unitId, name) // Buscar lanchonete pelo nome

      if (existing && existing.id !== excludeId) {
        return existing // Outra lanchonete com mesmo nome existe
      } else {
        return null // Não existe lanchonete com mesmo nome
      }
    },
    enabled: !!name.trim() && !!unitId, // só executa se o nome não estiver vazio e o unitId definido
    staleTime: 1000 * 60 * 5, // Cache por 5 minutos
  })
}
