import { Button } from "@/components/ui/button"
import { Card, CardContent, CardFooter, CardHeader, CardTitle } from "@/components/ui/card"
import { ICONS } from "@/constants/icons"
import { MAIN_TEXTS } from "@/constants/texts/main.texts"
import { UnitModel } from "@/types/domain/unit.types"
import { HugeiconsIcon } from "@hugeicons/react"
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
    <Card className="justify-between">
      <CardHeader>
        {/* Nome da unidade */}
        <CardTitle className="text-lg font-semibold">{unit.name}</CardTitle>
      </CardHeader>

      <CardContent className="space-y-2 text-base">
        {/* ID */}
        <div className="flex items-center gap-2">
          <HugeiconsIcon icon={ICONS.id} />
          <p>
            <strong>ID: </strong>
            {unit.id}
          </p>
        </div>

        {/* Quantidade de lanchonetes */}
        <div className="flex items-center gap-2">
          <HugeiconsIcon icon={ICONS.entities.snackBar} />
          <p>
            <strong>Lanchonetes: </strong> {10}
            {/* TODO: obter quantidade de lanchonetes */}
          </p>
        </div>
      </CardContent>

      <CardFooter className="flex *:flex-1 gap-2.5">
        {/* Botão de editar */}
        <Button variant="outline">
          <HugeiconsIcon icon={ICONS.actions.edit} />
          {MAIN_TEXTS.actions.edit}
        </Button>

        {/* Botão de excluir */}
        <Button variant="destructive">
          <HugeiconsIcon icon={ICONS.actions.delete} />
          {MAIN_TEXTS.actions.delete}
        </Button>
      </CardFooter>
    </Card>
  )
}
