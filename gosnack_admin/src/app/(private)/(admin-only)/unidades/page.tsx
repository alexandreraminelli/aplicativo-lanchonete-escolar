import UnitCardList from "@/components/common/units/UnitCardList"
import UnitDialog from "@/components/common/units/UnitDialog"
import { Button } from "@/components/ui/button"
import { PAGE_METADATA } from "@/constants/metadata"
import { UNITS_TEXTS } from "@/constants/texts/units.texts"
import { Add01Icon } from "@hugeicons/core-free-icons"
import { HugeiconsIcon } from "@hugeicons/react"
import { Metadata } from "next"

/** Metadados da página de unidades. */
export const metadata: Metadata = {
  title: PAGE_METADATA.units.title,
}

/**
 * Página de gerenciar unidades.
 */
export default function UnitsPage() {
  return (
    <section className="space-y-4">
      <header className="flex flex-col sm:flex-row gap-4 justify-between items-center">
        <h2 className="font-semibold text-3xl">{UNITS_TEXTS.mainPage.title}</h2>

        {/* Botão de adicionar unidade */}
        <UnitDialog
          mode="create"
          trigger={
            <Button>
              <HugeiconsIcon icon={Add01Icon} />
              {UNITS_TEXTS.actions.add}
            </Button>
          }
        />
      </header>

      {/* Lista de unidades */}
      <main>
        <UnitCardList />
      </main>
    </section>
  )
}
