import { cn } from "@/src/lib/utils"
import { type ClassValue } from "clsx"

/** Props de `LoginForm`. */
interface Props {
  className?: ClassValue
}

/** Formulário de login. */
export default function AuthForm({ className, ...props }: Props) {
  return <form className={cn("", className)} {...props}></form>
}
