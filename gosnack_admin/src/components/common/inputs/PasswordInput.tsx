import { Button } from "@/src/components/ui/button"
import { Input } from "@/src/components/ui/input"
import { Tooltip, TooltipContent, TooltipTrigger } from "@/src/components/ui/tooltip"
import { AUTH_TEXTS } from "@/src/constants/texts/auth.texts"
import { cn } from "@/src/lib/utils"
import { EyeIcon, EyeOffIcon } from "lucide-react"
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
  const label = isVisible ? AUTH_TEXTS.hidePassword : AUTH_TEXTS.showPassword

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
            {isVisible ? <EyeIcon /> : <EyeOffIcon />}
          </Button>
        </TooltipTrigger>
        {/* Texto do tooltip */}
        <TooltipContent>{label}</TooltipContent>
      </Tooltip>
    </div>
  )
}
