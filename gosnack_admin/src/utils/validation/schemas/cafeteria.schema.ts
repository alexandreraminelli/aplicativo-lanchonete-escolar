import { CAFETERIA_TEXTS } from "@/constants/texts/cafeteria.texts"
import { UNITS_TEXTS } from "@/constants/texts/units.texts"
import { DAYS_OF_WEEK } from "@/types/times.types"
import z from "zod"

/** Zod Schema para o formulário de lanchonetes. */
export const cafeteriaSchema = z.object({
  /** Validação da unidade escolar. */
  unitId: z.string().nonempty(UNITS_TEXTS.actions.select),

  /** Validação do nome da lanchonete. */
  name: z.string().nonempty(CAFETERIA_TEXTS.validation.name.required).min(5, CAFETERIA_TEXTS.validation.name.min),

  /** Validação da localização da lanchonete. */
  location: z.string().nonempty(CAFETERIA_TEXTS.validation.location.required),

  /** Validação dos horários de funcionamento. */
  openingHours: z
    .array(
      z.object({
        dayOfWeek: z.enum(DAYS_OF_WEEK),
        isOpen: z.boolean(),
        openingTime: z.string().optional(),
        closingTime: z.string().optional(),
      }),
    )
    .length(7)
    // Cada dia que estiver marcado como aberto, deve ter horário de abertura e fechamento (abertura < fechamento)
    .refine((days) => days.every((day) => !day.isOpen || (day.openingTime && day.closingTime && day.openingTime < day.closingTime)), {
      message: CAFETERIA_TEXTS.validation.openingHours.invalid,
    }),
})
