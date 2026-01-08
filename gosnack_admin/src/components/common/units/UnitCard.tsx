import { Card, CardDescription, CardHeader, CardTitle } from "@/components/ui/card"
import { UnitModel } from "@/types/domain/unit.types"
import { ClassValue } from "clsx"

/** Props de `UnitCard`. */
interface Props {
  /** Unidade. */
  unit: UnitModel

  /** Classes CSS adicionais. */
  className?: ClassValue
}

/** Card de unidades. */
export default function UnitCard({ unit }: Props) {
  return (
    <Card>
      <CardHeader>
        <CardTitle>{unit.name}</CardTitle>
        <CardDescription>{unit.id}</CardDescription>
      </CardHeader>
    </Card>
  )
}
