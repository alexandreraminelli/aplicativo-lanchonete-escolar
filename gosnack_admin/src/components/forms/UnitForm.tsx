"use client"

import { UNITS_TEXTS } from "@/constants/texts/units.texts"
import { useCreateUnit, useUpdateUnit } from "@/hooks/queries/units/unit.mutations"
import { cn } from "@/lib/utils"
import { UnitInputModel, UnitModel } from "@/types/domain/unit.types"
import { FormMode } from "@/types/form.types"
import { unitSchema } from "@/utils/validation/schemas/unitSchema"
import { zodResolver } from "@hookform/resolvers/zod"
import { ClassValue } from "clsx"
import { useState } from "react"
import { SubmitHandler, useForm } from "react-hook-form"
import { toast } from "sonner"
import z from "zod"
import { FieldGroup } from "../ui/field"
import { Form, FormControl, FormField, FormItem, FormLabel, FormMessage } from "../ui/form"
import { Input } from "../ui/input"

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
  const [originalValues, setOriginalValues] = useState(() => ({
    name: unit?.name || "",
  }))

  /** Definição do formulário. */
  const form = useForm<UnitFormData>({
    resolver: zodResolver(unitSchema), // zod schema para validação
    defaultValues: originalValues, // valores iniciais
  })

  /** Função executada ao submeter o formulário. */
  const handleSubmit: SubmitHandler<UnitFormData> = async (data) => {
    try {
      if (isCreate) {
        // Criar unidade
        const result = await createMutation.mutateAsync(data as UnitInputModel)

        toast.success(UNITS_TEXTS.success.create, {
          description: UNITS_TEXTS.success.createDescription(result.name),
        })
        onSuccess?.(result) // Notificar sucesso com a nova unidade
      } else {
        // Editar unidade
        await updateMutation.mutateAsync({ id: unit!.id, data })

        toast.success(UNITS_TEXTS.success.update, {
          description: UNITS_TEXTS.success.updateDescription(data.name),
        })
        onSuccess?.(data as UnitModel) // Notificar sucesso com a unidade atualizada
      }
    } catch (error) {
      // Mensagem de erro
      toast.error(UNITS_TEXTS.error.createUnit, { description: error instanceof Error ? error.message : String(error) })
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
          {/* Campo Nome */}
          <FormField
            control={form.control}
            name="name"
            render={({ field }) => (
              <FormItem>
                <FormLabel>{UNITS_TEXTS.fields.name}</FormLabel>
                <FormControl>
                  <Input type="text" placeholder={UNITS_TEXTS.placeholder.name} {...field} />
                </FormControl>
                <FormMessage />
              </FormItem>
            )}
          />
        </FieldGroup>
      </form>
    </Form>
  )
}
