"use client"

import { FormControl, FormField, FormItem, FormLabel } from "@/components/ui/form"
import { Input } from "@/components/ui/input"
import { Switch } from "@/components/ui/switch"
import { CAFETERIA_TEXTS } from "@/constants/texts/cafeteria.texts"
import { OpeningHoursGroup } from "@/types/domain/cafeteria.types"
import { Control, FieldValues, useWatch } from "react-hook-form"

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
  /** Observador do campo. */
  const openingHours = useWatch({
    control,
    name: "openingHours" as never,
  })

  // Se a lanchonete está aberta nos horários
  const weekdaysOpen = openingHours?.weekdays?.isOpen ?? false
  const saturdayOpen = openingHours?.saturday?.isOpen ?? false

  const dayPeriods: {
    value: OpeningHoursGroup
    label: string
    isOpen: boolean
  }[] = [
    // Dias da semana
    { value: "weekdays", label: CAFETERIA_TEXTS.openingHours.weekdays, isOpen: weekdaysOpen },
    // Sábado
    { value: "saturday", label: CAFETERIA_TEXTS.openingHours.saturday, isOpen: saturdayOpen },
  ]

  return (
    <div className="space-y-4">
      {/* Label */}
      <FormLabel>{CAFETERIA_TEXTS.fields.openingHours}</FormLabel>

      {/* Grade de horários de funcionamento */}
      {dayPeriods.map((day) => {
        const fieldName = `openingHours.${day.value}`

        return (
          <div key={day.value} className="flex items-center gap-4 rounded-md border p-3">
            {/* Label dia da semana */}
            <span className="w-28 font-medium">{day.label}</span>

            {/* Switch aberto/fechado */}
            <FormField
              control={control}
              name={`${fieldName}.isOpen` as never}
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
              name={`${fieldName}.openingTime` as never}
              render={({ field }) => (
                <FormItem>
                  <FormControl>
                    <Input type="time" disabled={!day.isOpen} {...field} />
                  </FormControl>
                </FormItem>
              )}
            />

            {/* Separador */}
            <span>--</span>

            {/* Horário de fechamento */}
            <FormField
              control={control}
              name={`${fieldName}.closingTime` as never}
              render={({ field }) => (
                <FormItem>
                  <FormControl>
                    <Input type="time" disabled={!day.isOpen} {...field} />
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
