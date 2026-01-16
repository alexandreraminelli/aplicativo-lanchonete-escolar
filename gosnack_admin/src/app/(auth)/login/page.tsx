import AuthForm from "@/components/forms/AuthForm"
import { PAGE_METADATA } from "@/constants/metadata"
import { AUTH_TEXTS } from "@/constants/texts/auth.texts"
import { Metadata } from "next"

/** Metadados da página de login. */
export const metadata: Metadata = {
  title: PAGE_METADATA.login.title,
}

/**
 * Página de autenticação.
 */
export default function LoginPage() {
  return (
    <main className="space-y-6">
      {/* Header */}
      <header className="flex flex-col items-center gap-2 text-center">
        <h1 className="text-2xl font-bold">{AUTH_TEXTS.loginHeader.loginTitle}</h1>
        <p className="text-muted-foreground text-balance">{AUTH_TEXTS.loginHeader.loginSubtitle}</p>
      </header>

      {/* Formulário de login */}
      <AuthForm mode="sign-in" />
    </main>
  )
}
