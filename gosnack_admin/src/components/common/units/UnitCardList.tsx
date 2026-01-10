"use client"

import { Button } from "@/components/ui/button"
import { IMAGES } from "@/constants/images"
import { UNITS_TEXTS } from "@/constants/texts/units.texts"
import { useUnits } from "@/hooks/queries/units/unit.queries"
import { Add01Icon } from "@hugeicons/core-free-icons"
import { HugeiconsIcon } from "@hugeicons/react"
import { toast } from "sonner"
import EmptyState from "../feedback/EmptyState"
import UnitCard from "./UnitCard"
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
              <HugeiconsIcon icon={Add01Icon} />
              {UNITS_TEXTS.actions.add}
            </Button>
          }
        />
      </EmptyState>
    )
  }

  // Cards de unidade
  return (
    <section className="">
      {units.map((unit) => (
        <UnitCard key={unit.id} unit={unit} />
      ))}
    </section>
  )
}

/** Skeleton de carregamento do `UnitCardList`. */
function UnitCardListSkeleton() {
  // TODO: Implementar skeleton
  return <p>Loading...</p>
}
