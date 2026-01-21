import CafeteriaCardList from "@/components/common/cafeterias/CafeteriaList"
import HeaderWithTitleAndButton from "@/components/common/layout/headers/HeaderWithTitleAndButton"
import { Button } from "@/components/ui/button"
import { ICONS } from "@/constants/icons"
import { ROUTES } from "@/constants/navigation/routes"
import { CAFETERIA_TEXTS } from "@/constants/texts/cafeteria.texts"
import { HugeiconsIcon } from "@hugeicons/react"
import { Metadata } from "next"
import Link from "next/link"

/** Metadados da página de lanchonetes. */
export const metadata: Metadata = {
  title: CAFETERIA_TEXTS.management,
}

/** Página de lanchonetes. */
export default function CafeteriasPage() {
  return (
    <section className="space-y-4">
      {/* Header */}
      <HeaderWithTitleAndButton title={CAFETERIA_TEXTS.management} icon={ICONS.entities.cafeteria}>
        {/* Botão de adicionar lanchonete */}
        <Button asChild>
          <Link href={ROUTES.newCafeteria}>
            <HugeiconsIcon icon={ICONS.actions.create} />
            {CAFETERIA_TEXTS.actions.add}
          </Link>
        </Button>
      </HeaderWithTitleAndButton>

      <main>
        {/* Lista de lanchonetes */}
        <CafeteriaCardList />
      </main>
    </section>
  )
}
