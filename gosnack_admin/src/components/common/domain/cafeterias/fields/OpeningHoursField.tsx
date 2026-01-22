"use client"

import { Field, FieldContent, FieldGroup, FieldLabel, FieldTitle } from "@/components/ui/field"
import { FormControl, FormField, FormItem, FormLabel } from "@/components/ui/form"
import { Input } from "@/components/ui/input"
import { Switch } from "@/components/ui/switch"
import { CAFETERIA_TEXTS } from "@/constants/texts/cafeteria.texts"
import { cn } from "@/lib/utils"
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
    <FormItem>
      {/* Label */}
      <FormLabel>{CAFETERIA_TEXTS.fields.openingHours}</FormLabel>

      {/* Grade de horários de funcionamento */}
      <FieldGroup className="w-full gap-2">
        {dayPeriods.map((day) => {
          const fieldName = `openingHours.${day.value}`
          const switchId = `switch-${day.value}`

          return (
            <FieldLabel
              key={day.value}
              htmlFor={switchId}
              className={cn("", {
                "border-zinc-600 dark:border-zinc-400 bg-zinc-500/10": day.isOpen,
              })}
            >
              <Field orientation="horizontal">
                <FieldContent>
                  {/* Label período */}
                  <FieldTitle className={cn("mb-2", { "text-muted-foreground": !day.isOpen })}>{day.label}</FieldTitle>

                  {/* Horários */}
                  <div className="flex flex-row items-center gap-2">
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
                </FieldContent>

                {/* Switch aberto/fechado */}
                <FormField
                  control={control}
                  name={`${fieldName}.isOpen` as never}
                  render={({ field }) => (
                    <FormItem>
                      <FormControl>
                        <Switch id={switchId} checked={field.value} onCheckedChange={field.onChange} />
                      </FormControl>
                    </FormItem>
                  )}
                />
              </Field>
            </FieldLabel>
          )
        })}
      </FieldGroup>
    </FormItem>
  )
}
