import { AUTH_TEXTS } from "@/constants/texts/auth.texts"
import { USER_ROLES } from "@/types/users/user.types"
import { REGEX_PATTERNS } from "@/utils/validation/patterns"
import { z } from "zod"

/** Zod Schema para formulário de cadastro. */
export const signUpSchema = z.object({
  /** Validação do campo de primeiro nome. */
  firstName: z.string().min(2, AUTH_TEXTS.validation.name.firstName.required),
  /** Validação do campo de sobrenome. */
  lastName: z.string().min(2, AUTH_TEXTS.validation.name.firstName.required),
  /** Validação do campo de e-mail. */
  email: z.email(AUTH_TEXTS.validation.email.required),
  /** Validação do campo de senha. */
  password: z
    .string(AUTH_TEXTS.validation.password.required)
    .min(8, AUTH_TEXTS.validation.password.length) // mínimo 8 caracteres
    .regex(REGEX_PATTERNS.upper, AUTH_TEXTS.validation.password.upperCase) // letras maiúsculas
    .regex(REGEX_PATTERNS.lower, AUTH_TEXTS.validation.password.lowerCase) // letras minúsculas
    .regex(REGEX_PATTERNS.digit, AUTH_TEXTS.validation.password.digit) // dígitos
    .regex(REGEX_PATTERNS.specialChar, AUTH_TEXTS.validation.password.specialChar), // caracteres especiais
  /** Validação do campo de papel do usuário. */
  role: z.enum(USER_ROLES, AUTH_TEXTS.validation.role.required),

  // TODO: adicionar validação pros campos próprios para gerentes e funcionários
})

/** Zod Schema para formulário de login. */
export const signInSchema = signUpSchema.pick({ email: true, password: true })
