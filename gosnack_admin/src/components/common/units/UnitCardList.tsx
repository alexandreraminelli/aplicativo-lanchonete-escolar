"use client"

import { UnitRepository } from "@/lib/firebase/firestore/repositories/unit.repository"
import UnitCard from "./UnitCard"
import { UnitModel } from "@/types/domain/unit.types"
import { useEffect, useState } from "react"
import { toast } from "sonner"
import { UNITS_TEXTS } from "@/constants/texts/units.texts"

/** Lista de cards de unidades escolares. */
export default function UnitCardList() {
  const [units, setUnits] = useState<UnitModel[]>([])
  const [loading, setLoading] = useState(true)

  // Obter unidades do Firestore
  useEffect(() => {
    async function fetchUnits() {
      try {
        const allUnits = await UnitRepository.findAll()
        setUnits(allUnits)
      } catch {
        toast.error(UNITS_TEXTS.error.getUnits.title, { description: UNITS_TEXTS.error.getUnits.message })
      } finally {
        setLoading(false)
      }
    }
    fetchUnits()
  }, [])

  // Skeleton durante carregamento
  if (loading) return <UnitCardListSkeleton />

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
