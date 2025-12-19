import { AUTH_TEXTS } from "@/src/constants/texts/auth.texts"
import { z } from "zod"
import { REGEX_PATTERNS } from "../patterns"
import { USER_ROLES, type UserRole } from "@/src/types/users/user.types"

/** Zod Schema para formulário de cadastro. */
export const signUpSchema = z.object({
  /** Validação do campo de primeiro nome. */
  firstName: z.string().min(2, AUTH_TEXTS.firstNameRequired),
  /** Validação do campo de sobrenome. */
  lastName: z.string().min(2, AUTH_TEXTS.lastNameRequired),
  /** Validação do campo de e-mail. */
  email: z.email(AUTH_TEXTS.emailRequired),
  /** Validação do campo de senha. */
  password: z
    .string(AUTH_TEXTS.passwordRequired)
    .min(8, AUTH_TEXTS.passwordLength) // mínimo 8 caracteres
    .regex(REGEX_PATTERNS.upper, AUTH_TEXTS.passwordCase) // letras maiúsculas
    .regex(REGEX_PATTERNS.lower, AUTH_TEXTS.passwordCase) // letras minúsculas
    .regex(REGEX_PATTERNS.digit, AUTH_TEXTS.passwordDigit) // dígitos
    .regex(REGEX_PATTERNS.specialChar, AUTH_TEXTS.passwordSpecialChar), // caracteres especiais
  /** Validação do campo de papel do usuário. */
  role: z.enum(USER_ROLES, AUTH_TEXTS.roleRequired),

  // TODO: adicionar validação pros campos próprios para gerentes e funcionários
})

/** Zod Schema para formulário de login. */
export const signInSchema = signUpSchema.pick({ email: true, password: true })
