import CafeteriaForm from "@/components/forms/CafeteriaForm"
import { CAFETERIA_TEXTS } from "@/constants/texts/cafeteria.texts"
import { Metadata } from "next"

/** Metadados da página de usuários. */
export const metadata: Metadata = {
  title: CAFETERIA_TEXTS.actions.add,
}

/** Página de adicionar nova lanchonete. */
export default function NewCafeteriaPage() {
  return <p>Página de nova lanchonete</p>
}
