"use client"

import { Button } from "@/components/ui/button"
import { ICONS } from "@/constants/icons"
import { IMAGES } from "@/constants/images"
import { UNITS_TEXTS } from "@/constants/texts/units.texts"
import { useUnits } from "@/hooks/queries/units/unit.queries"
import { HugeiconsIcon } from "@hugeicons/react"
import { toast } from "sonner"
import EmptyState from "../../feedback/EmptyState"
import UnitCard from "./UnitCard"
import UnitCardListSkeleton from "./UnitCardListSkeleton"
import UnitDialog from "./UnitDialog"

/** Lista de cards de unidades escolares. */
export default function UnitCardList() {
  // Buscar unidades usando React Query
  const { data: units = [], isLoading, isError } = useUnits()

  // Skeleton durante carregamento
  if (isLoading) return <UnitCardListSkeleton />

  // Tratamento de erro
  if (isError) {
    toast.error(UNITS_TEXTS.error.getUnits.title, { description: UNITS_TEXTS.error.getUnits.message })
  }

  // Se não houver unidades
  if (units.length === 0) {
    return (
      <EmptyState title={UNITS_TEXTS.empty.title} message={Object.values(UNITS_TEXTS.empty.message)} image={IMAGES.illustrations.schoolUnit}>
        {/* Botão de adicionar unidade */}
        <UnitDialog
          mode="create"
          trigger={
            <Button>
              <HugeiconsIcon icon={ICONS.actions.create} />
              {UNITS_TEXTS.actions.add}
            </Button>
          }
        />
      </EmptyState>
    )
  }

  // Cards de unidade
  return (
    <>
      {/* Quantidade de unidades */}
      <p className="text-muted-foreground mb-4">{UNITS_TEXTS.quant(units.length)}</p>

      <section className="grid gap-4 grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4">
        {units.map((unit) => (
          <UnitCard key={unit.id} unit={unit} />
        ))}
      </section>
    </>
  )
}
