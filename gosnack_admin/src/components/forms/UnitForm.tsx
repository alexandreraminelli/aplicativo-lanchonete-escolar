"use client"

import { MAIN_TEXTS } from "@/constants/texts/main.texts"
import { UNITS_TEXTS } from "@/constants/texts/units.texts"
import { UnitRepository } from "@/lib/firebase/firestore/repositories/unit.repository"
import { cn } from "@/lib/utils"
import { UnitInputModel, UnitModel } from "@/types/domain/unit.types"
import { FormMode } from "@/types/form.types"
import { unitSchema } from "@/utils/validation/schemas/unitSchema"
import { zodResolver } from "@hookform/resolvers/zod"
import { Loading03Icon, Plus } from "@hugeicons/core-free-icons"
import { HugeiconsIcon } from "@hugeicons/react"
import { ClassValue } from "clsx"
import { useState } from "react"
import { SubmitHandler, useForm } from "react-hook-form"
import { toast } from "sonner"
import z from "zod"
import { Button } from "../ui/button"
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
}

/** Formulário para criar/editar unidades escolares. */
export default function UnitForm({ mode, className, unit, ...props }: Props) {
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
    try {
      if (isCreate) {
        // Criar unidade
        const result = await UnitRepository.create(data as UnitInputModel)

        // TODO: toast de sucesso
      } else {
        // Editar unidade
        const result = await UnitRepository.update(unit!.id, data as Partial<UnitModel>)

        // TODO: toast de sucesso
      }
    } catch (error) {
      // Mensagem de erro
      toast.error(UNITS_TEXTS.error.createUnit, { description: error instanceof Error ? error.message : String(error) })
    }
  }

  return (
    <Form {...form}>
      <form
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

          {/* Botão de enviar */}
          <Button
            type="submit"
            disabled={form.formState.isSubmitting} // desabilitar durante submissão
          >
            {/* Ícone de carregamento */}
            {form.formState.isSubmitting && <HugeiconsIcon icon={Loading03Icon} className="animate-spin" />}

            {/* Ícone */}
            <HugeiconsIcon icon={Plus} />
            {/* Rótulo do botão */}
            {isCreate ? MAIN_TEXTS.actions.create : MAIN_TEXTS.actions.save}
          </Button>
        </FieldGroup>
      </form>
    </Form>
  )
}
