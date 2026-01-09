"use client"

import { IMAGES } from "@/constants/images"
import { UNITS_TEXTS } from "@/constants/texts/units.texts"
import { UnitRepository } from "@/lib/firebase/firestore/repositories/unit.repository"
import { UnitModel } from "@/types/domain/unit.types"
import { useEffect, useState } from "react"
import { toast } from "sonner"
import EmptyState from "../feedback/EmptyState"
import UnitCard from "./UnitCard"
import UnitDialog from "./UnitDialog"
import { Button } from "@/components/ui/button"
import { HugeiconsIcon } from "@hugeicons/react"
import { Add01Icon } from "@hugeicons/core-free-icons"

/** Lista de cards de unidades escolares. */
export default function UnitCardList() {
  const [units, setUnits] = useState<UnitModel[]>([])
  const [loading, setLoading] = useState(true)

  /** Função para buscar unidades. */
  async function fetchUnits() {
    setLoading(true)
    try {
      const allUnits = await UnitRepository.findAll()
      setUnits(allUnits)
    } catch {
      toast.error(UNITS_TEXTS.error.getUnits.title, { description: UNITS_TEXTS.error.getUnits.message })
    } finally {
      setLoading(false)
    }
  }

  // Obter unidades do Firestore
  useEffect(() => {
    fetchUnits()
  }, [])

  /** Função para adicionar unidade à lista. */
  const handleUnitAdded = (newUnit: UnitModel) => {
    setUnits((prevUnits) => [...prevUnits, newUnit])
  }

  // Skeleton durante carregamento
  if (loading) return <UnitCardListSkeleton />

  // Se não houver unidades
  if (units.length === 0) {
    return (
      <EmptyState title={UNITS_TEXTS.empty.title} message={Object.values(UNITS_TEXTS.empty.message)} image={IMAGES.illustrations.schoolUnit}>
        {/* Botão de adicionar unidade */}
        <UnitDialog
          mode="create"
          onSuccess={handleUnitAdded}
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
