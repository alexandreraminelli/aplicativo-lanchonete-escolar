import { UNITS_TEXTS } from "@/constants/texts/units.texts"
import z from "zod"

/** Zod Schema para formulário de unidades. */
export const unitSchema = z.object({
  /** Nome da unidade. */
  name: z.string().min(5, UNITS_TEXTS.validation.name),
})
