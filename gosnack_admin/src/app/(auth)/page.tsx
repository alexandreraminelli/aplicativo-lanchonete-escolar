import { Card, CardContent } from "@/src/components/ui/card"
import AuthForm from "../../components/forms/AuthForm"
import Image from "next/image"
import { IMAGES } from "@/src/constants/images"
import Logo from "@/src/components/common/logos/Logo"
import { ModeToggle } from "@/src/components/layout/ModeToggle"

/**
 * Página de autenticação.
 */
export default function LoginPage() {
  return (
    <div
      className="bg-muted min-h-svh
        flex flex-col items-center justify-center
        p-6 md:p-10 pt-0! gap-4"
    >
      <LoginHeader />

      {/* Card Central */}
      <div className="w-full max-w-sm md:max-w-4xl">
        <main className="flex flex-col gap-6">
          <Card className="overflow-hidden p-0">
            <CardContent className="grid p-0 md:grid-cols-2">
              {/* TODO: Header com logo e ModeToggle */}

              {/* Formulário de login */}
              <AuthForm className="p-6 md:p-8" />

              {/* Imagem */}
              <aside className="bg-muted relative hidden md:block">
                <Image
                  src={IMAGES.loginBg}
                  alt="Cantina escolar"
                  // Ajustar imagem
                  fill
                  className="object-cover"
                />
              </aside>
            </CardContent>
          </Card>
        </main>
      </div>
    </div>
  )
}

/** Cabeçalho da página de login. */
function LoginHeader() {
  return (
    <header className="flex flex-row items-center gap-8">
      <Logo />
      <ModeToggle />
    </header>
  )
}
