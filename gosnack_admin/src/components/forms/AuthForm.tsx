import { Field, FieldGroup, FieldLabel } from "@/src/components/ui/field"
import { AUTH_TEXTS } from "@/src/constants/texts/auth.texts"
import { cn } from "@/src/lib/utils"
import { type ClassValue } from "clsx"
import { Button } from "../ui/button"
import { Input } from "../ui/input"

/** Props de `LoginForm`. */
interface Props {
  className?: ClassValue
}

/** Formulário de autenticação. */
export default function AuthForm({ className, ...props }: Props) {
  return (
    <form className={cn("", className)} {...props}>
      <FieldGroup>
        <AuthFormHeader />

        {/* Campo de e-mail */}
        <Field>
          <FieldLabel htmlFor="email">{AUTH_TEXTS.email}</FieldLabel>
          <Input id="email" type="email" placeholder="m@example.com" required />
        </Field>

        {/* Campo de senha */}
        {/* TODO: criar componente de senha com botão de mostrar/ocultar */}
        <Field>
          <div className="flex items-center">
            <FieldLabel htmlFor="password">{AUTH_TEXTS.password}</FieldLabel>
            {/* Botão de esqueceu a senha */}
            <Button type="button" variant="link" className="ml-auto text-sm py-0 h-fit">
              {AUTH_TEXTS.forgotPassword}
            </Button>
          </div>
          <Input id="password" type="password" required />
        </Field>

        {/* Botão de enviar */}
        <Field>
          <Button>{AUTH_TEXTS.loginSubmit}</Button>
        </Field>
      </FieldGroup>
    </form>
  )
}

/** Cabeçalho do formulário de autenticação. */
function AuthFormHeader() {
  return (
    <header className="flex flex-col items-center gap-2 text-center">
      <h1 className="text-2xl font-bold">{AUTH_TEXTS.loginTitle}</h1>
      <p className="text-muted-foreground text-balance">{AUTH_TEXTS.loginSubtitle}</p>
    </header>
  )
}
