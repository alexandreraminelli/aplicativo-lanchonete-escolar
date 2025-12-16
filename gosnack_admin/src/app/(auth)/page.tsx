import { Card, CardContent } from "@/src/components/ui/card"
import LoginForm from "./_components/LoginForm"
import Image from "next/image"

/**
 * Página de autenticação.
 */
export default function LoginPage() {
  return (
    <div
      className="bg-muted min-h-svh
        flex flex-col items-center justify-center
        p-6 md:p-10"
    >
      <div className="w-full max-w-sm md:max-w-4xl">
        <div className="flex flex-col gap-6">
          <Card className="overflow-hidden p-0">
            <CardContent className="grid p-0 md:grid-cols-2">
              {/* Formulário de login */}
              <LoginForm className="p-6 md:p-8" />

              {/* Imagem */}
              <div className="bg-muted relative hidden md:block">
                <Image src="/images/photos/login-bg.jpg" alt="Cantina escolar" width={560} height={560} />
              </div>
            </CardContent>
          </Card>
        </div>
      </div>
    </div>
  )
}
