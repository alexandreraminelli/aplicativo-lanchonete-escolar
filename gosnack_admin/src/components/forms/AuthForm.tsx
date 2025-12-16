import { FieldGroup } from "@/src/components/ui/field"
import { AUTH_TEXTS } from "@/src/constants/texts/auth.texts"
import { cn } from "@/src/lib/utils"
import { type ClassValue } from "clsx"

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
