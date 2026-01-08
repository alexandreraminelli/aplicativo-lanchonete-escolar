import UnitCardList from "@/components/common/units/UnitCardList"
import UnitForm from "@/components/forms/UnitForm"
import { Button } from "@/components/ui/button"
import { Dialog, DialogContent, DialogFooter, DialogHeader, DialogTitle, DialogTrigger } from "@/components/ui/dialog"
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
      <header className="flex flex-col md:flex-row gap-4 justify-between items-center">
        <h2 className="font-semibold text-3xl">{UNITS_TEXTS.mainPage.title}</h2>

        {/* Botão de adicionar unidade */}
        <Dialog>
          <DialogTrigger asChild>
            <Button>
              <HugeiconsIcon icon={Add01Icon} />
              {UNITS_TEXTS.actions.add}
            </Button>
          </DialogTrigger>

          {/* Conteúdo do dialog */}
          <DialogContent>
            <DialogHeader>
              <DialogTitle>{UNITS_TEXTS.actions.add}</DialogTitle>
            </DialogHeader>
            <section className="px-4">
              {/* Formulário de criar unidade */}
              <UnitForm mode="create" />
            </section>
          </DialogContent>
        </Dialog>
      </header>

      {/* Lista de unidades */}
      <main>
        <UnitCardList />
      </main>
    </section>
  )
}
