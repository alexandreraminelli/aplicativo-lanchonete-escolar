import { Card, CardContent } from "@/src/components/ui/card"
import { cn } from "@/src/lib/utils"
import { type ClassValue } from "clsx"
import Image from "next/image"

/** Props de `LoginForm`. */
interface Props {
  className?: ClassValue
}

/** Formulário de login. */
export default function LoginForm({ className, ...props }: Props) {
  return (
    <form className={cn("", className)} {...props}>
      Formulário de login
    </form>
  )
}
