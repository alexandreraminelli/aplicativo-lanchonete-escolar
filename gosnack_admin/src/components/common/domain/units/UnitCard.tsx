import { Button } from "@/components/ui/button"
import { Card, CardContent, CardFooter, CardHeader, CardTitle } from "@/components/ui/card"
import { ICONS } from "@/constants/icons"
import { MAIN_TEXTS } from "@/constants/texts/main.texts"
import { UnitModel } from "@/types/domain/unit.types"
import { HugeiconsIcon, IconSvgElement } from "@hugeicons/react"
import { ClassValue } from "clsx"
import DeleteUnitButton from "./DeleteUnitButton"
import UnitDialog from "./UnitDialog"
import { useCafeteriaCount } from "@/hooks/queries/cafeterias/cafeteria.queries"

/** Props de `UnitCard`. */
interface Props {
  /** Unidade. */
  unit: UnitModel

  /** Classes CSS adicionais. */
  className?: ClassValue
}

/** Card de unidades. */
export default function UnitCard({ unit }: Props) {
  // Obter contagem de lanchonetes
  const { data: cafeteriaCount } = useCafeteriaCount(unit.id)

  const unitInfo: { label: string; value: string; icon: IconSvgElement }[] = [
    // ID
    {
      label: MAIN_TEXTS.fields.id,
      value: unit.id,
      icon: ICONS.id,
    },
    // Quantidade de Lanchonetes
    {
      label: MAIN_TEXTS.entities.cafeterias,
      value: `${cafeteriaCount ?? "..."}`,
      icon: ICONS.entities.cafeteria,
    },
  ]

  return (
    <Card className="justify-between">
      <CardHeader>
        {/* Nome da unidade */}
        <CardTitle className="text-lg font-semibold">{unit.name}</CardTitle>
      </CardHeader>

      <CardContent>
        {/* Informações da unidade */}
        <dl className="space-y-2 text-base">
          {unitInfo.map((info, index) => (
            <div key={index} className="flex items-center gap-2">
              {/* Ícone */}
              <HugeiconsIcon icon={info.icon} className="size-5" />
              {/* Texto */}
              <p className="truncate text-ellipsis *:inline">
                <dt className="font-bold">{`${info.label}: `}</dt>
                <dd>{info.value}</dd>
              </p>
            </div>
          ))}
        </dl>
      </CardContent>

      <CardFooter className="flex *:flex-1 gap-2.5">
        {/* Botão de editar */}
        <UnitDialog
          mode="edit"
          unit={unit}
          trigger={
            <Button variant="outline">
              <HugeiconsIcon icon={ICONS.actions.edit} />
              {MAIN_TEXTS.actions.edit}
            </Button>
          }
        />

        {/* Botão de excluir */}
        <DeleteUnitButton unit={unit} />
      </CardFooter>
    </Card>
  )
}
