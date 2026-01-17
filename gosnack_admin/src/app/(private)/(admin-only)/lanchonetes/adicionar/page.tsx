import FormWithImageLayout from "@/components/common/layout/forms/FormWithImageLayout"
import CafeteriaForm from "@/components/forms/CafeteriaForm"
import { IMAGES } from "@/constants/images"
import { CAFETERIA_TEXTS } from "@/constants/texts/cafeteria.texts"
import { Metadata } from "next"

/** Metadados da página de usuários. */
export const metadata: Metadata = {
  title: CAFETERIA_TEXTS.actions.add,
}

/** Página de adicionar nova lanchonete. */
export default function NewCafeteriaPage() {
  return (
    <FormWithImageLayout title={CAFETERIA_TEXTS.actions.add} image={IMAGES.illustrations.cafeteria}>
      <CafeteriaForm />
    </FormWithImageLayout>
  )
}
