import { Button } from "@/components/ui/button"
import { Card, CardDescription, CardFooter, CardHeader, CardTitle } from "@/components/ui/card"
import { ICONS } from "@/constants/icons"
import { ROUTES } from "@/constants/navigation/routes"
import { MAIN_TEXTS } from "@/constants/texts/main.texts"
import { CafeteriaModel } from "@/types/domain/cafeteria.types"
import { HugeiconsIcon } from "@hugeicons/react"
import Link from "next/link"

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

      <CardDescription>{/* TODO: informações da lanchonete */}</CardDescription>

      <CardFooter className="*:flex-1">
        {/* Botão de mais informações */}
        <Button variant="secondary" asChild className="no-underline">
          <Link href={ROUTES.cafeteriaInfo(cafeteria.id)}>
            <HugeiconsIcon icon={ICONS.actions.moreDetails} />
            {MAIN_TEXTS.actions.moreDetails}
          </Link>
        </Button>
      </CardFooter>
    </Card>
  )
}
