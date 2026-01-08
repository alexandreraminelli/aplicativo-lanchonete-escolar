import { IMAGES } from "@/constants/images"
import { MAIN_TEXTS } from "@/constants/texts/main.texts"
import EmptyState from "./EmptyState"

/** Mensagem de acesso negado. */
export default function AccessDeniedMessage() {
  return <EmptyState title={MAIN_TEXTS.accessDenied.title} message={Object.values(MAIN_TEXTS.accessDenied.message)} image={IMAGES.illustrations.accessDenied} />
}
