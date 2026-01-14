import Logo from "@/components/common/logos/Logo"
import { ModeToggle } from "@/components/layout/header/ModeToggle"
import { Card, CardContent } from "@/components/ui/card"
import { IMAGES } from "@/constants/images"
import { PAGE_METADATA } from "@/constants/metadata"
import { Metadata } from "next"
import Image from "next/image"
import AuthForm from "../../../components/forms/AuthForm"
import { AUTH_TEXTS } from "@/constants/texts/auth.texts"

/** Metadados da página de login. */
export const metadata: Metadata = {
  title: PAGE_METADATA.login.title,
}

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
        <div className="flex flex-col gap-6">
          <Card className="overflow-hidden p-0">
            <CardContent className="grid p-0 md:grid-cols-2">
              <main className="p-6 md:p-8 space-y-6">
                {/* Header */}
                <LoginFormHeader />

                {/* Formulário de login */}
                <AuthForm mode="sign-in" />
              </main>

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
        </div>
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

/** Cabeçalho do formulário de autenticação. */
function LoginFormHeader() {
  return (
    <header className="flex flex-col items-center gap-2 text-center">
      <h1 className="text-2xl font-bold">{AUTH_TEXTS.loginTitle}</h1>
      <p className="text-muted-foreground text-balance">{AUTH_TEXTS.loginSubtitle}</p>
    </header>
  )
}
