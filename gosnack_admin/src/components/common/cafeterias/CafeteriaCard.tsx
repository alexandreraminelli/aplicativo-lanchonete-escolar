import { Card, CardDescription, CardHeader, CardTitle } from "@/components/ui/card"
import { CafeteriaModel } from "@/types/domain/cafeteria.types"

/** Props de `CafeteriaCard`. */
interface Props {
  cafeteria: CafeteriaModel
}

/** Card de lanchonete. */
export default function CafeteriaCard({ cafeteria }: Props) {
  return (
    <Card>
      <CardHeader>
        <CardTitle>{cafeteria.name}</CardTitle>
        <CardDescription>{cafeteria.id}</CardDescription>
      </CardHeader>
    </Card>
  )
}
