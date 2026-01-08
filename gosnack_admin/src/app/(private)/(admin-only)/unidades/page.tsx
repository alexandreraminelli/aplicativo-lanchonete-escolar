import UnitCardList from "@/components/common/units/UnitCardList"
import { PAGE_METADATA } from "@/constants/metadata"
import { UNITS_TEXTS } from "@/constants/texts/units.texts"
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
    <section>
      <header>
        <h2 className="font-semibold text-3xl">{UNITS_TEXTS.mainPage.title}</h2>
      </header>

      {/* Lista de unidades */}
      <main>
        <UnitCardList />
      </main>
    </section>
  )
}
