"use client"

import { FormControl, FormField, FormItem, FormLabel } from "@/components/ui/form"
import { Input } from "@/components/ui/input"
import { Switch } from "@/components/ui/switch"
import { CAFETERIA_TEXTS } from "@/constants/texts/cafeteria.texts"
import { MAIN_TEXTS } from "@/constants/texts/main.texts"
import { DayOfWeek } from "@/types/times.types"
import { Control, FieldValues, useFieldArray, useWatch } from "react-hook-form"

/**
 * Props do componente de campo de horários de funcionamento.
 */
type OpeningHoursFieldProps<TFormValues extends FieldValues = FieldValues> = {
  control: Control<TFormValues>
}

/**
 * Componente de campo de horários de funcionamento para formulários de lanchonetes.
 */
export function OpeningHoursField<TFormValues extends FieldValues>({ control }: OpeningHoursFieldProps<TFormValues>) {
  /** Hook para manipular array de campos de horários de funcionamento. */
  const { fields } = useFieldArray({
    control,
    name: "openingHours" as never,
  })

  /** Observador do campo. */
  const openingHours = useWatch({
    control,
    name: "openingHours" as never,
  })

  return (
    <div className="space-y-4">
      {/* Label */}
      <FormLabel>{CAFETERIA_TEXTS.fields.openingHours}</FormLabel>

      {fields.map((field, index) => {
        // Obter texto do label
        const dayOfWeek = openingHours?.[index]?.dayOfWeek as DayOfWeek
        const dayLabel = MAIN_TEXTS.time.dayOfWeek[dayOfWeek]
        const isOpen = openingHours?.[index]?.isOpen ?? false

        return (
          <div key={field.id} className="flex items-center gap-4 rounded-md border p-3">
            {/* Label dia da semana */}
            <span className="w-28 font-medium">{dayLabel}</span>

            {/* Switch aberto/fechado */}
            <FormField
              control={control}
              name={`openingHours.${index}.isOpen` as never}
              render={({ field }) => (
                <FormItem>
                  <FormControl>
                    <Switch checked={field.value} onCheckedChange={field.onChange} />
                  </FormControl>
                </FormItem>
              )}
            />

            {/* Horário de abertura */}
            <FormField
              control={control}
              name={`openingHours.${index}.openingTime` as never}
              render={({ field }) => (
                <FormItem>
                  <FormControl>
                    <Input type="time" disabled={!isOpen} {...field} />
                  </FormControl>
                </FormItem>
              )}
            />

            {/* Separador */}
            <span>--</span>

            {/* Horário de fechamento */}
            <FormField
              control={control}
              name={`openingHours.${index}.closingTime` as never}
              render={({ field }) => (
                <FormItem>
                  <FormControl>
                    <Input type="time" disabled={!isOpen} {...field} />
                  </FormControl>
                </FormItem>
              )}
            />
          </div>
        )
      })}
    </div>
  )
}
