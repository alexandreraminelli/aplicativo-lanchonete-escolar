import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Tooltip, TooltipContent, TooltipTrigger } from "@/components/ui/tooltip"
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
    <div className={cn("relative", className)}>
      {/* Campo */}
      <Input
        type={isVisible ? "text" : "password"} // alternar visibilidade
        placeholder="********"
        autoComplete={isSignUp ? "new-password" : "current-password"} // semântica
        {...props}
      />
      {/* Botão */}
      <Tooltip>
        <TooltipTrigger asChild className="text-muted-foreground absolute inset-y-0 right-0">
          <Button
            // Configuração do botão
            type="button"
            variant="ghost"
            size="icon"
            onClick={handleToggleVisibility}
            aria-label={label}
          >
            {/* Ícone */}
            <HugeiconsIcon icon={isVisible ? ICONS.auth.password.show : ICONS.auth.password.hide} />
          </Button>
        </TooltipTrigger>
        {/* Texto do tooltip */}
        <TooltipContent>{label}</TooltipContent>
      </Tooltip>
    </div>
  )
}
