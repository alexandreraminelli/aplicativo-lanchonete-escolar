import AuthForm from "@/components/forms/AuthForm"

/** Página de adicionar novo usuário. */
export default function AddUserPage() {
  return (
    <div>
      Adicionar Usuário
      {/* Form de cadastro */}
      <AuthForm mode="sign-up" />
    </div>
  )
}
