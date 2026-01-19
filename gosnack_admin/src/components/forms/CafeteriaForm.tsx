"use client"

import { Button } from "@/components/ui/button"
import { Combobox, ComboboxContent, ComboboxEmpty, ComboboxInput, ComboboxItem, ComboboxList, ComboboxValue } from "@/components/ui/combobox"
import { FieldGroup } from "@/components/ui/field"
import { Form, FormField, FormItem, FormLabel, FormMessage } from "@/components/ui/form"
import { ICONS } from "@/constants/icons"
import { CAFETERIA_TEXTS } from "@/constants/texts/cafeteria.texts"
import { MAIN_TEXTS } from "@/constants/texts/main.texts"
import { UNITS_TEXTS } from "@/constants/texts/units.texts"
import { useCreateCafeteria } from "@/hooks/queries/cafeterias/cafeteria.mutations"
import { useCheckCafeteriaName } from "@/hooks/queries/cafeterias/cafeteria.queries"
import { useUnits } from "@/hooks/queries/units/unit.queries"
import { cafeteriaSchema } from "@/utils/validation/schemas/cafeteria.schema"
import { zodResolver } from "@hookform/resolvers/zod"
import { HugeiconsIcon } from "@hugeicons/react"
import { SubmitHandler, useForm, useWatch } from "react-hook-form"
import { toast } from "sonner"
import z from "zod"

/** Tipagem dos dados do form de lanchonete. */
type CafeteriaFormData = z.infer<typeof cafeteriaSchema>

/** Formulário para adicionar uma nova lanchonete. */
export default function CafeteriaForm() {
  /** Hook de navegação do Next.js. */
  // const router = useRouter()

  // Hooks de mutação do React Query
  const createMutation = useCreateCafeteria()

  // Buscar unidades para o combobox
  const { data: units = [], isLoading: isLoadingUnits } = useUnits()

  /** Definição do formulário de cafeteria. */
  const form = useForm<CafeteriaFormData>({
    resolver: zodResolver(cafeteriaSchema), // zod schema para validação
    defaultValues: {
      unitId: "",
      name: "",
      location: "",
    },
  })

  /** Hook para observar valores dos campos. */
  const watched = useWatch<CafeteriaFormData>({ control: form.control })
  /** Observador do campo de unidades. */
  const unitIdValue = watched.unitId
  /** Observador do campo nome. */
  const nameValue = watched.name ?? ""

  // Verificar se já existe lanchonete com o mesmo nome
  const { data: existingCafeteria } = useCheckCafeteriaName(unitIdValue, nameValue)

  /** Função executada ao submeter o formulário. */
  const handleSubmit: SubmitHandler<CafeteriaFormData> = (data) => {
    // Verificar se já existe lanchonete com o mesmo nome
    if (existingCafeteria) {
      toast.warning(CAFETERIA_TEXTS.error.duplicateName)
      return
    }

    // Criar lanchonete
    toast.promise(
      createMutation.mutateAsync({
        unitId: data.unitId,
        data: {
          name: data.name,
          location: data.location,

          // TODO: adicionar campos faltantes
          openingHours: [],
          isActive: false,
        },
      }),
      {
        loading: CAFETERIA_TEXTS.loading.creating,
        success: CAFETERIA_TEXTS.success.create,
        error: CAFETERIA_TEXTS.error.create,
      },
    )
  }

  return (
    <Form {...form}>
      <form
        onSubmit={form.handleSubmit(handleSubmit)} // função para lidar com o envio
        className="space-y-4"
      >
        <FieldGroup>
          {/* Unidade */}
          <FormField
            control={form.control}
            name="unitId"
            render={({ field }) => (
              <FormItem>
                {/* Label unidade */}
                <FormLabel>{MAIN_TEXTS.entities.schoolUnit}</FormLabel>
                {/* Combobox unidade */}
                <Combobox
                  value={field.value}
                  onValueChange={field.onChange}
                  disabled={isLoadingUnits} // aguardar carregamento das unidades
                >
                  {/* Input visível */}
                  <ComboboxInput placeholder={isLoadingUnits ? UNITS_TEXTS.loading.getting : UNITS_TEXTS.select}>
                    {/* Nome da unidade selecionada */}
                    <ComboboxValue>
                      {(value) => {
                        const unit = units.find((u) => u.id === value)
                        return unit?.name ?? ""
                      }}
                    </ComboboxValue>
                  </ComboboxInput>
                  {/* Dropdown */}
                  <ComboboxContent>
                    {units.length === 0 ? (
                      <ComboboxEmpty>{UNITS_TEXTS.empty.title}</ComboboxEmpty> // se estiver vazio
                    ) : (
                      <ComboboxList>
                        {units.map((unit) => (
                          <ComboboxItem key={unit.id} value={unit.id}>
                            {unit.name}
                          </ComboboxItem>
                        ))}
                      </ComboboxList>
                    )}
                    {/* Se estiver vazio */}
                  </ComboboxContent>
                </Combobox>
                {/* Mensagem do zod */}
                <FormMessage />
              </FormItem>
            )}
          />
        </FieldGroup>

        <FieldGroup>
          {/* Botão de submit */}
          <Button size="lg" type="submit" disabled={form.formState.isSubmitting}>
            {/* Ícone de carregamento */}
            {form.formState.isSubmitting && <HugeiconsIcon icon={ICONS.actions.loading} className="animate-spin" />}
            {/* Ícone + Texto */}
            <HugeiconsIcon icon={ICONS.actions.create} />
            {CAFETERIA_TEXTS.actions.add}
          </Button>
        </FieldGroup>
      </form>
    </Form>
  )
}
