"use client"

import { UNITS_TEXTS } from "@/constants/texts/units.texts"
import { UnitRepository } from "@/lib/firebase/firestore/repositories/unit.repository"
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
  /** Função executada quando o status de carregamento mudar. */
  onSubmitStateChange?: (isSubmitting: boolean) => void
  /** Função executada quando a submissão for concluída com sucesso. */
  onSuccess?: () => void
}

/** Formulário para criar/editar unidades escolares. */
export default function UnitForm({ mode, className, unit, id, onSubmitStateChange, onSuccess, ...props }: Props) {
  /** Se o formulário é de criação. */
  const isCreate = mode === "create"

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
    onSubmitStateChange?.(true) // notificar início da submissão

    try {
      if (isCreate) {
        // Criar unidade
        const result = await UnitRepository.create(data as UnitInputModel)

        toast.success(UNITS_TEXTS.success.create)
      } else {
        // Editar unidade
        const result = await UnitRepository.update(unit!.id, data as Partial<UnitModel>)

        toast.success(UNITS_TEXTS.success.update)
      }

      onSuccess?.() // Notificar sucesso
    } catch (error) {
      // Mensagem de erro
      toast.error(UNITS_TEXTS.error.createUnit, { description: error instanceof Error ? error.message : String(error) })
    } finally {
      onSubmitStateChange?.(false) // Notificar fim da submissão
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
                  <Input type="text" {...field} />
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
