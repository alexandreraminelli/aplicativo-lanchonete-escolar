import InfoList, { InfoItemType } from "@/components/common/data-display/InfoList"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardFooter, CardHeader, CardTitle } from "@/components/ui/card"
import { ICONS } from "@/constants/icons"
import { ROUTES } from "@/constants/navigation/routes"
import { CAFETERIA_TEXTS } from "@/constants/texts/cafeteria.texts"
import { MAIN_TEXTS } from "@/constants/texts/main.texts"
import { USERS_TEXTS } from "@/constants/texts/users.texts"
import { CafeteriaModel } from "@/types/domain/cafeteria.types"
import { HugeiconsIcon } from "@hugeicons/react"
import Link from "next/link"

/** Props de `CafeteriaCard`. */
interface Props {
  unitId: string
  cafeteria: CafeteriaModel
}

/** Card de lanchonete. */
export default function CafeteriaCard({ unitId, cafeteria }: Props) {
  /** Informações da cafeteria. */
  const cafeteriaInfos: InfoItemType[] = [
    // Localização
    { label: CAFETERIA_TEXTS.fields.location, value: cafeteria.location, icon: ICONS.location },

    // Gerente
    {
      label: USERS_TEXTS.roles.manager,
      value: "", // TODO: obter nome do gerente (se houver)
      icon: ICONS.users.roles.manager,
    },
  ]

  const weekdaysHours = cafeteria.openingHours.weekdays
  const saturdayHours = cafeteria.openingHours.saturday
  /** Informações de horários de funcionamento. */
  const openingHoursInfos: InfoItemType[] = [
    { label: CAFETERIA_TEXTS.fields.openingHours, value: "", icon: ICONS.time.clock },
    // Segunda a sexta
    {
      label: CAFETERIA_TEXTS.openingHours.weekdays,
      value: weekdaysHours.isOpen ? `${weekdaysHours.openingTime} - ${weekdaysHours.closingTime}` : CAFETERIA_TEXTS.openingHours.closed,
    },
    // Sábado
    { label: CAFETERIA_TEXTS.openingHours.saturday, value: saturdayHours.isOpen ? `${saturdayHours.openingTime} - ${saturdayHours.closingTime}` : CAFETERIA_TEXTS.openingHours.closed },
  ]

  return (
    <Card>
      <CardHeader>
        <CardTitle className="font-semibold text-lg">{cafeteria.name}</CardTitle>
      </CardHeader>

      <CardContent className="space-y-2">
        {/* Informações da lanchonete */}
        <InfoList infoList={cafeteriaInfos} />

        {/* Horários de funcionamento */}
        <section className="text-base">
          <InfoList infoList={openingHoursInfos} className="space-y-0.5" />
        </section>
      </CardContent>

      <CardFooter className="*:flex-1">
        {/* Botão de mais informações */}
        <Button variant="secondary" asChild className="no-underline">
          <Link href={ROUTES.cafeteriaInfo(unitId, cafeteria.id)}>
            <HugeiconsIcon icon={ICONS.actions.moreDetails} />
            {MAIN_TEXTS.actions.moreDetails}
          </Link>
        </Button>
      </CardFooter>
    </Card>
  )
}
