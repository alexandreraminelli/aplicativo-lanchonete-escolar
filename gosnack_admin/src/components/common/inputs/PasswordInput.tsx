import { InputGroup, InputGroupButton, InputGroupInput } from "@/components/ui/input-group"
import { ICONS } from "@/constants/icons"
import { AUTH_TEXTS } from "@/constants/texts/auth.texts"
import { cn } from "@/lib/utils"
import { HugeiconsIcon } from "@hugeicons/react"
import { useState } from "react"

/** Props de `PasswordInput`. */
interface Props {
  /** Se o formulário é de criar senha. */
  isSignUp: boolean
}

/** Campo de senha com botão de ocultar e link de esqueceu a senha. */
export default function PasswordInput({ isSignUp, className, ...props }: React.ComponentProps<"input"> & Props) {
  /** Estado da visibilidade da senha. */
  const [isVisible, setIsVisible] = useState(false)

  /** Rótulo do botão. */
  const label = isVisible ? AUTH_TEXTS.actions.password.hide : AUTH_TEXTS.actions.password.show

  /** Função para alternar a visibilidade da senha. */
  const handleToggleVisibility = (e: React.MouseEvent<HTMLButtonElement>) => {
    e.preventDefault() // Prevenir o comportamento padrão (enviar form)
    e.stopPropagation() // Evitar a propagação para outros elementos
    setIsVisible(!isVisible) // Alternar visibilidade
  }

  return (
    <InputGroup className={cn(className)}>
      {/* Input principal */}
      <InputGroupInput
        type={isVisible ? "text" : "password"} // visibilidade
        placeholder="********"
        autoComplete={isSignUp ? "new-password" : "current-password"} // semântica
        {...props}
      />

      {/* Botão de mostrar/ocultar */}
      <InputGroupButton type="button" size="sm" onClick={handleToggleVisibility} aria-label={label}>
        {/* Ícone */}
        <HugeiconsIcon icon={isVisible ? ICONS.auth.password.show : ICONS.auth.password.hide} />
        {/* Texto para acessibilidade */}
        <span className="sr-only">{label}</span>
      </InputGroupButton>
    </InputGroup>
  )
}
