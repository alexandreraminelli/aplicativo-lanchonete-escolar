import CafeteriaCardList from "@/components/common/cafeterias/CafeteriaCardList"
import { Button } from "@/components/ui/button"
import { ICONS } from "@/constants/icons"
import { CAFETERIA_TEXTS } from "@/constants/texts/cafeteria.texts"
import { HugeiconsIcon } from "@hugeicons/react"

/** Página de lanchonetes. */
export default function CafeteriasPage() {
  return (
    <section className="space-y-4">
      {/* Header */}
      <header className="flex flex-col sm:flex-row gap-4 justify-between items-center">
        <h2 className="font-semibold text-3xl">{CAFETERIA_TEXTS.management}</h2>

        {/* Botão de adicionar lanchonete */}
        <Button>
          <HugeiconsIcon icon={ICONS.actions.create} />
          {CAFETERIA_TEXTS.actions.add}
        </Button>
      </header>

      <main>
        {/* Lista de lanchonetes */}
        <CafeteriaCardList />
      </main>
    </section>
  )
}
