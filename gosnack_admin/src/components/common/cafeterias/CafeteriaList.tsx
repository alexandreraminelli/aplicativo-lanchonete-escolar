"use client"

import { Accordion, AccordionContent, AccordionItem, AccordionTrigger } from "@/components/ui/accordion"
import { CAFETERIA_TEXTS } from "@/constants/texts/cafeteria.texts"
import { useCafeterias } from "@/hooks/queries/cafeterias/cafeteria.queries"
import { useUnits } from "@/hooks/queries/units/unit.queries"
import CafeteriaCard from "./CafeteriaCard"
import { CafeteriaCardListSkeleton, UnitCafeteriasListSkeleton } from "./CafeteriaListSkeleton"

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
        <AccordionItem key={unit.id} value={unit.id}>
          {/* Nome da unidade */}
          <AccordionTrigger className="px-2 hover:bg-accent-foreground/10 hover:no-underline items-center">
            <h3 className="text-lg">{unit.name}</h3>
          </AccordionTrigger>

          {/* Lista de lanchonetes da unidade. */}
          <AccordionContent className="py-2">
            <UnitCafeteriasList unitId={unit.id} />
          </AccordionContent>
        </AccordionItem>
      ))}
    </Accordion>
  )
}

/**
 * Lista de cards de lanchonetes de uma unidade.
 */
function UnitCafeteriasList({ unitId }: { unitId: string }) {
  // Carregar lista de lanchonetes
  const { data: cafeterias = [], isLoading } = useCafeterias(unitId)

  if (isLoading) {
    return <UnitCafeteriasListSkeleton />
  }

  if (cafeterias.length === 0) {
    return <p className="text-center text-muted-foreground">{CAFETERIA_TEXTS.empty.byUnit}</p>
  }

  return (
    <div className="p-3 grid gap-3">
      {cafeterias.map((cafeteria) => (
        <CafeteriaCard key={cafeteria.id} cafeteria={cafeteria} />
      ))}
    </div>
  )
}
6
