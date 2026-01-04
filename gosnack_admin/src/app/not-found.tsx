import PrivateLayout from "@/src/app/(private)/layout"
import EmptyState from "@/src/components/common/feedback/EmptyState"
import { IMAGES } from "@/src/constants/images"
import { MAIN_TEXTS } from "@/src/constants/texts/main.texts"

/** Página de erro 404 - Não Encontrado. */
export default function NotFoundPage() {
  return (
    <PrivateLayout>
      <EmptyState title={MAIN_TEXTS.notFound.title} message={Object.values(MAIN_TEXTS.notFound.message)} image={IMAGES.illustrations.notFound} />
    </PrivateLayout>
  )
}
