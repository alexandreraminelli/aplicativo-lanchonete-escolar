"use client"

import { FieldGroup } from "@/components/ui/field"
import { Form, FormControl, FormField, FormItem, FormLabel, FormMessage } from "@/components/ui/form"
import { Input } from "@/components/ui/input"
import { UNITS_TEXTS } from "@/constants/texts/units.texts"
import { useCreateUnit, useUpdateUnit } from "@/hooks/queries/units/unit.mutations"
import { useCheckUnitName } from "@/hooks/queries/units/unit.queries"
import { cn } from "@/lib/utils"
import { UnitInputModel, UnitModel } from "@/types/domain/unit.types"
import { FormMode } from "@/types/form.types"
import { unitSchema } from "@/utils/validation/schemas/unit.schema"
import { zodResolver } from "@hookform/resolvers/zod"
import { ClassValue } from "clsx"
import { useState } from "react"
import { SubmitHandler, useForm, useWatch } from "react-hook-form"
import { toast } from "sonner"
import z from "zod"

/** Tipagem dos dados do form. */
type UnitFormData = z.infer<typeof unitSchema>

/** Props de `UnitForm`. */
interface Props {
  mode: FormMode
  className?: ClassValue

  /** Unidade a ser editada. */
  unit?: UnitModel
  /** ID do formulário para associar com botões externos. */
  id?: string

  /** Callback executado quando a submissão for concluída com sucesso. */
  onSuccess?: (unit: UnitModel) => void
}

/** Formulário para criar/editar unidades escolares. */
export default function UnitForm({ mode, className, unit, id, onSuccess, ...props }: Props) {
  /** Se o formulário é de criação. */
  const isCreate = mode === "create"

  // Hooks de mutação do React Query
  const createMutation = useCreateUnit()
  const updateMutation = useUpdateUnit()

  /** Valores originais para comparação e destaque das alterações. */
  const [originalValues] = useState(() => ({
    name: unit?.name || "",
  }))

  /** Definição do formulário. */
  const form = useForm<UnitFormData>({
    resolver: zodResolver(unitSchema), // zod schema para validação
    defaultValues: originalValues, // valores iniciais
  })

  /** Hook para observar valores dos campos. */
  const watched = useWatch<UnitFormData>({ control: form.control })

  // Verificar se já existe unidade com o mesmo nome
  /** Observador do campo nome. */
  const nameValue = watched.name ?? ""
  const { data: existingUnit } = useCheckUnitName(nameValue, isCreate ? undefined : unit?.id)

  /** Função para verificar se um campo foi alterado. */
  const isFieldChanged = (fieldName: keyof typeof originalValues) => {
    // Comparar valor atual com o original
    return watched?.[fieldName] !== originalValues[fieldName]
  }
  /** Função para obter classes CSS para campos alterados. */
  const getFieldClasses = (fieldName: keyof typeof originalValues): ClassValue => {
    if (mode === "create") return "" // não afetar campos no form de criação
    return isFieldChanged(fieldName) ? "ring-2 ring-primary border-primary bg-primary/10" : ""
  }
  /** Função para obter classes CSS para label de campos alterados. */
  const getLabelClasses = (fieldName: keyof typeof originalValues): ClassValue => {
    if (mode === "create") return "" // não afetar campos no form de criação
    return isFieldChanged(fieldName) ? "text-primary" : ""
  }

  /** Função executada ao submeter o formulário. */
  const handleSubmit: SubmitHandler<UnitFormData> = (data) => {
    // Verificar se já existe unidade com o mesmo nome
    if (existingUnit) {
      toast.warning(UNITS_TEXTS.error.duplicateName.title, { description: UNITS_TEXTS.error.duplicateName.description(data.name) })
      return
    }

    if (isCreate) {
      // Criar unidade
      toast.promise(
        createMutation.mutateAsync(data as UnitInputModel), // hook
        {
          loading: UNITS_TEXTS.loading.creating,
          // Sucesso
          success: (result) => {
            onSuccess?.(result) // Notificar sucesso com a nova unidade
            return UNITS_TEXTS.success.create
          },
          // Erro
          error: UNITS_TEXTS.error.create,
        },
      )
    } else {
      // Editar unidade
      toast.promise(
        updateMutation.mutateAsync({ id: unit!.id, data }), // hook
        {
          loading: UNITS_TEXTS.loading.updating,
          // Sucesso
          success: () => {
            onSuccess?.(data as UnitModel) // Notificar sucesso com a unidade atualizada
            return UNITS_TEXTS.success.update
          },
          // Erro
          error: UNITS_TEXTS.error.update,
        },
      )
    }
  }

  return (
    <Form {...form}>
      <form
        id={id} // ID do form para controle externo
        onSubmit={form.handleSubmit(handleSubmit)} // função para lidar com o envio
        className={cn("", className)}
        {...props}
      >
        <FieldGroup>
          {/* Campo ID (read only) */}
          {unit && (
            <div className="space-y-2">
              <FormLabel>{UNITS_TEXTS.fields.id}</FormLabel>
              <Input value={unit.id} readOnly />
            </div>
          )}

          {/* Campo Nome */}
          <FormField
            control={form.control}
            name="name"
            render={({ field }) => (
              <FormItem>
                <FormLabel className={cn(getLabelClasses(field.name))}>{UNITS_TEXTS.fields.name}</FormLabel>
                <FormControl>
                  <Input type="text" placeholder={UNITS_TEXTS.placeholder.name} className={cn(getFieldClasses(field.name))} {...field} />
                </FormControl>
                {existingUnit && <FormMessage>{UNITS_TEXTS.error.duplicateName.message}</FormMessage>}
                <FormMessage />
              </FormItem>
            )}
          />
        </FieldGroup>
      </form>
    </Form>
  )
}
