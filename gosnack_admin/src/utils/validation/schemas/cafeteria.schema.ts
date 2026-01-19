import { CAFETERIA_TEXTS } from "@/constants/texts/cafeteria.texts"
import { UNITS_TEXTS } from "@/constants/texts/units.texts"
import z from "zod"

/** Zod Schema para o formulário de lanchonetes. */
export const cafeteriaSchema = z.object({
  /** Validação da unidade escolar. */
  unitId: z.string().nonempty(UNITS_TEXTS.select),

  /** Validação do nome da lanchonete. */
  name: z.string().nonempty(CAFETERIA_TEXTS.validation.name.required).min(5, CAFETERIA_TEXTS.validation.name.min),

  /** Validação da localização da lanchonete. */
  location: z.string().nonempty(CAFETERIA_TEXTS.validation.location.required),
})
