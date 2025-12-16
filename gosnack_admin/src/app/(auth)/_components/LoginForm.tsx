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
    <div className={cn("flex flex-col gap-6", className)} {...props}>
      <Card className="overflow-hidden p-0">
        <CardContent className="grid p-0 md:grid-cols-2">
          {/* Formulário */}
          <form className="p-6 md:p-8">Formulário de login</form>

          {/* Imagem */}
          <div className="bg-muted relative hidden md:block">
            <Image src="/images/photos/login-bg.jpg" alt="Cantina escolar" width={560} height={560} />
          </div>
        </CardContent>
      </Card>
    </div>
  )
}
