import { CAFETERIA_TEXTS } from "@/constants/texts/cafeteria.texts"
import z from "zod"

/** Zod Schema para o formulário de lanchonetes. */
export const cafeteriaSchema = z.object({
  /** Validação do nome da lanchonete. */
  name: z.string().nonempty(CAFETERIA_TEXTS.validation.name.required).min(5, CAFETERIA_TEXTS.validation.name.min),

  /** Validação da localização da lanchonete. */
  location: z.string().nonempty(CAFETERIA_TEXTS.validation.location.required),
})
