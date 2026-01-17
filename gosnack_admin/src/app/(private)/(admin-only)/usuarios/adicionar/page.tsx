import FormWithImageLayout from "@/components/common/layout/forms/FormWithImageLayout"
import AuthForm from "@/components/forms/AuthForm"
import { IMAGES } from "@/constants/images"
import { USERS_TEXTS } from "@/constants/texts/users.texts"
import { Metadata } from "next"

/** Metadados da página de adicionar usuário. */
export const metadata: Metadata = {
  title: USERS_TEXTS.actions.create,
}

/** Página de adicionar novo usuário. */
export default function AddUserPage() {
  return (
    <FormWithImageLayout title={USERS_TEXTS.actions.create} image={IMAGES.illustrations.addUser}>
      <AuthForm mode="sign-up" />
    </FormWithImageLayout>
  )
}
