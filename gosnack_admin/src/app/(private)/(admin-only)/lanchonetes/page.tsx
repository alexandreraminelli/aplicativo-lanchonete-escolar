import CafeteriaCardList from "@/components/common/cafeterias/CafeteriaCardList"
import HeaderWithTitleAndButton from "@/components/common/layout/headers/HeaderWithTitleAndButton"
import { Button } from "@/components/ui/button"
import { ICONS } from "@/constants/icons"
import { CAFETERIA_TEXTS } from "@/constants/texts/cafeteria.texts"
import { HugeiconsIcon } from "@hugeicons/react"

/** Página de lanchonetes. */
export default function CafeteriasPage() {
  return (
    <section className="space-y-4">
      {/* Header */}
      <HeaderWithTitleAndButton title={CAFETERIA_TEXTS.management} icon={ICONS.entities.cafeteria}>
        {/* Botão de adicionar lanchonete */}
        <Button>
          <HugeiconsIcon icon={ICONS.actions.create} />
          {CAFETERIA_TEXTS.actions.add}
        </Button>
      </HeaderWithTitleAndButton>

      <main>
        {/* Lista de lanchonetes */}
        <CafeteriaCardList />
      </main>
    </section>
  )
}
