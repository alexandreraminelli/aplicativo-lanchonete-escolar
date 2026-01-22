"use client"

import { Accordion, AccordionContent, AccordionItem, AccordionTrigger } from "@/components/ui/accordion"
import { CAFETERIA_TEXTS } from "@/constants/texts/cafeteria.texts"
import { useCafeteriaCount, useCafeterias } from "@/hooks/queries/cafeterias/cafeteria.queries"
import { useUnits } from "@/hooks/queries/units/unit.queries"
import CafeteriaCard from "./CafeteriaCard"
import { CafeteriaCardListSkeleton, UnitCafeteriasListSkeleton } from "./CafeteriaListSkeleton"
import { useEffect, useState } from "react"
import { UnitModel } from "@/types/domain/unit.types"
import { Badge } from "@/components/ui/badge"
import { HugeiconsIcon } from "@hugeicons/react"
import { ICONS } from "@/constants/icons"

/**
 * Lista de lanchonetes organizados por unidade.
 */
export default function CafeteriaCardList() {
  // Obter unidades
  const { data: units = [], isLoading } = useUnits()

  if (isLoading) {
    return <CafeteriaCardListSkeleton />
  }

  return (
    <Accordion type="multiple">
      {units.map((unit) => (
        <CafeteriaAccordionItem key={unit.id} unit={unit} />
      ))}
    </Accordion>
  )
}

/** Item do accordion. */
function CafeteriaAccordionItem({ unit }: { unit: UnitModel }) {
  // estado do carregamento para atualizar altura do AccordionContent
  const [loading, setLoading] = useState(true)

  // Obter contagem de lanchonetes
  const { data: cafeteriaCount } = useCafeteriaCount(unit.id)

  return (
    <AccordionItem value={unit.id}>
      {/* Nome da unidade */}
      <AccordionTrigger className="px-2 hover:bg-accent-foreground/10 hover:no-underline items-center">
        <div className="flex items-center justify-between w-full me-4">
          <h3 className="text-lg">{unit.name}</h3>

          {/* Quantidade de lanchonetes */}
          <Badge variant="secondary">{cafeteriaCount ?? <HugeiconsIcon icon={ICONS.actions.loading} className="animate-spin" />}</Badge>
        </div>
      </AccordionTrigger>

      {/* Conteúdo do accordion. */}
      <AccordionContent
        key={loading ? "loading" : "loaded"} // forçar renderização quando terminar carregamento
        className="py-2 h-fit [&_a]:no-underline [&_a]:hover:no-underline"
      >
        <UnitCafeteriasList unitId={unit.id} onLoadingChange={setLoading} />
      </AccordionContent>
    </AccordionItem>
  )
}

/**
 * Props de `UnitCafeteriasList`.
 */
interface UnitCafeteriasListProps {
  unitId: string
  onLoadingChange: (loading: boolean) => void
}

/**
 * Lista de cards de lanchonetes de uma unidade.
 */
function UnitCafeteriasList({ unitId, onLoadingChange }: UnitCafeteriasListProps) {
  // Carregar lista de lanchonetes
  const { data: cafeterias = [], isLoading } = useCafeterias(unitId)

  // Estado para atualizar altura do AccordionContent
  useEffect(() => {
    onLoadingChange(isLoading)
  }, [isLoading, onLoadingChange])

  if (isLoading) {
    return <UnitCafeteriasListSkeleton />
  }

  if (cafeterias.length === 0) {
    return <p className="text-center text-muted-foreground py-10">{CAFETERIA_TEXTS.empty.byUnit}</p>
  }

  return (
    <div className="p-3 grid gap-4 grid-cols-1 md:grid-cols-2 lg:grid-cols-3">
      {cafeterias.map((cafeteria) => (
        <CafeteriaCard key={cafeteria.id} unitId={unitId} cafeteria={cafeteria} />
      ))}
    </div>
  )
}
