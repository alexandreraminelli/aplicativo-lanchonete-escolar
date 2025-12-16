import { FieldGroup } from "@/src/components/ui/field"
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
  const title = "GoSnack: Painel de Controle"
  const subtitle = "Acesse o sistema para gerenciar pedidos e produtos."

  return (
    <header className="flex flex-col items-center gap-2 text-center">
      <h1 className="text-2xl font-bold">{title}</h1>
      <p className="text-muted-foreground text-balance">{subtitle}</p>
    </header>
  )
}
