import { AlertDialog, AlertDialogAction, AlertDialogCancel, AlertDialogContent, AlertDialogDescription, AlertDialogFooter, AlertDialogHeader, AlertDialogTitle, AlertDialogTrigger } from "@/components/ui/alert-dialog"
import { Button } from "@/components/ui/button"
import { ICONS } from "@/constants/icons"
import { MAIN_TEXTS } from "@/constants/texts/main.texts"
import { UNITS_TEXTS } from "@/constants/texts/units.texts"
import { useDeleteUnit } from "@/hooks/queries/units/unit.mutations"
import { UnitModel } from "@/types/domain/unit.types"
import { HugeiconsIcon } from "@hugeicons/react"
import { toast } from "sonner"

/** Props de `DeleteUnitButton`. */
interface Props {
  unit: UnitModel
}

/** Botão de excluir unidade que abre um alert dialog de confirmação. */
export default function DeleteUnitButton({ unit }: Props) {
  const deleteMutation = useDeleteUnit() // Hook de mutação para exclusão

  /** Função para excluir uma unidade. */
  const handleDelete = () => {
    toast.promise(deleteMutation.mutateAsync(unit.id), {
      loading: UNITS_TEXTS.loading.deleting,
      success: UNITS_TEXTS.success.delete,
      error: UNITS_TEXTS.error.delete,
    })
  }

  return (
    <AlertDialog>
      <AlertDialogTrigger asChild>
        {/* Botão */}
        <Button variant="destructive">
          <HugeiconsIcon icon={ICONS.actions.delete} />
          {MAIN_TEXTS.actions.delete}
        </Button>
      </AlertDialogTrigger>

      {/* Dialog */}
      <AlertDialogContent>
        {/* Header */}
        <AlertDialogHeader>
          <AlertDialogTitle>{UNITS_TEXTS.confirm.delete.title}</AlertDialogTitle>
          <AlertDialogDescription>{UNITS_TEXTS.confirm.delete.message(unit.name)}</AlertDialogDescription>
        </AlertDialogHeader>

        {/* Botões */}
        <AlertDialogFooter>
          {/* Cancelar */}
          <AlertDialogCancel disabled={deleteMutation.isPending}>{MAIN_TEXTS.actions.cancel}</AlertDialogCancel>

          {/* Excluir */}
          <AlertDialogAction variant="destructive" onClick={handleDelete} disabled={deleteMutation.isPending}>
            <HugeiconsIcon icon={ICONS.actions.delete} />
            {UNITS_TEXTS.actions.delete}
          </AlertDialogAction>
        </AlertDialogFooter>
      </AlertDialogContent>
    </AlertDialog>
  )
}
