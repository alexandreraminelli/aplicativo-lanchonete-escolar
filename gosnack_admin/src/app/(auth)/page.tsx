import LoginForm from "./_components/LoginForm"

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
        <LoginForm /> {/* Formulário de login */}
      </div>
    </div>
  )
}
