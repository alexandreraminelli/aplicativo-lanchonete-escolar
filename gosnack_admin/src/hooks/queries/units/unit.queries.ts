import { useQuery } from "@tanstack/react-query"
import { unitKeys } from "./unit.keys"
import { UnitRepository } from "@/lib/firebase/firestore/repositories/unit.repository"

/** Lista todas as unidades. */
export function useUnits() {
  return useQuery({
    queryKey: unitKeys.lists(),
    queryFn: () => UnitRepository.findAll(),
  })
}

/** Busca uma unidade pelo ID. */
export function useUnit(unitId?: string) {
  return useQuery({
    queryKey: unitKeys.detail(unitId),
    queryFn: () => UnitRepository.findById(unitId!),
    enabled: !!unitId, // só executa se o unitId estiver definido
  })
}
