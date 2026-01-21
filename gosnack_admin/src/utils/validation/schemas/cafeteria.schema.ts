import { CAFETERIA_TEXTS } from "@/constants/texts/cafeteria.texts"
import { UNITS_TEXTS } from "@/constants/texts/units.texts"
import z from "zod"

/** Zod schema de intervalo de horário. */
const timeRangeSchema = z
  .object({
    isOpen: z.boolean(),
    openingTime: z.string().optional(),
    closingTime: z.string().optional(),
  })
  // Se isOpen for true, openingTime and closingTime são obrigatórios e openingTime deve ser menor que closingTime
  .refine((data) => !data.isOpen || (data.openingTime && data.closingTime && data.openingTime < data.closingTime), {
    error: CAFETERIA_TEXTS.validation.openingHours.invalidRange,
  })

/** Zod schema de horários de funcionamento. */
const openingHoursSchema = z.object({
  /** Segunda a sexta (obrigatório). */
  weekdays: timeRangeSchema,
  /** Sábado (opcional). */
  saturday: timeRangeSchema.optional(),
})

/** Zod Schema para o formulário de lanchonetes. */
export const cafeteriaSchema = z.object({
  /** Validação da unidade escolar. */
  unitId: z.string().nonempty(UNITS_TEXTS.actions.select),

  /** Validação do nome da lanchonete. */
  name: z.string().nonempty(CAFETERIA_TEXTS.validation.name.required).min(5, CAFETERIA_TEXTS.validation.name.min),

  /** Validação da localização da lanchonete. */
  location: z.string().nonempty(CAFETERIA_TEXTS.validation.location.required),

  /** Validação dos horários de funcionamento. */
  openingHours: openingHoursSchema,
})
