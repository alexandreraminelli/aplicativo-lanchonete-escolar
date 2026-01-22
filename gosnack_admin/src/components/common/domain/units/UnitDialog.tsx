"use client"

import UnitForm from "@/components/forms/UnitForm"
import { Button } from "@/components/ui/button"
import { Dialog, DialogClose, DialogContent, DialogFooter, DialogHeader, DialogTitle, DialogTrigger } from "@/components/ui/dialog"
import { ICONS } from "@/constants/icons"
import { MAIN_TEXTS } from "@/constants/texts/main.texts"
import { UNITS_TEXTS } from "@/constants/texts/units.texts"
import { useCreateUnit, useUpdateUnit } from "@/hooks/queries/units/unit.mutations"
import { UnitModel } from "@/types/domain/unit.types"
import { FormMode } from "@/types/form.types"
import { HugeiconsIcon } from "@hugeicons/react"
import { ReactNode, useState } from "react"

/** Props de `UnitDialog`. */
interface Props {
  mode: FormMode
  unit?: UnitModel
  trigger: ReactNode

  /** Callback executado quando a operação do form for bem-sucedida. */
  onSuccess?: (unit: UnitModel) => void
}

/** Dialog que exibe um form de unidade. */
export default function UnitDialog({ mode, unit, trigger, onSuccess }: Props) {
  /** Se formulário é de criar unidade. */
  const isCreate = mode === "create"
  /** ID para controlar o formulário. */
  const formId = "unit-form"

  // Hooks de mutação
  const createMutation = useCreateUnit()
  const updateMutation = useUpdateUnit()

  /** Estado para controlar a abertura e fechamento do Dialog. */
  const [open, setOpen] = useState(false)
  /** Estado para informar o estado da submissão do form. */
  const isSubmitting = createMutation.isPending || updateMutation.isPending

  /** Função executada quando a submissão for um sucesso. */
  const handleSuccess = (savedUnit: UnitModel) => {
    setOpen(false) // fechar dialog
    onSuccess?.(savedUnit) // notificar o componente pai
  }

  return (
    <Dialog open={open} onOpenChange={setOpen}>
      {/* Botão visível */}
      <DialogTrigger asChild>{trigger}</DialogTrigger>

      {/* Conteúdo do Dialog */}
      <DialogContent>
        {/* Header */}
        <DialogHeader>
          <DialogTitle>{isCreate ? UNITS_TEXTS.actions.add : UNITS_TEXTS.actions.edit}</DialogTitle>
        </DialogHeader>

        {/* Formulário */}
        <UnitForm mode={mode} unit={unit} id={formId} onSuccess={handleSuccess} />

        <DialogFooter>
          {/* Botão de cancelar */}
          <DialogClose asChild>
            <Button variant="outline" disabled={isSubmitting}>
              {MAIN_TEXTS.actions.cancel}
            </Button>
          </DialogClose>

          {/* Botão de enviar */}
          <Button type="submit" form={formId} disabled={isSubmitting}>
            {/* Ícone de carregamento */}
            {isSubmitting && <HugeiconsIcon icon={ICONS.actions.loading} className="animate-spin" />}

            {isCreate ? MAIN_TEXTS.actions.create : MAIN_TEXTS.actions.save}
          </Button>
        </DialogFooter>
      </DialogContent>
    </Dialog>
  )
}
