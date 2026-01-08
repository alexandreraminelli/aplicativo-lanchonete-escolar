import PrivateLayout from "@/app/(private)/layout"
import EmptyState from "@/components/common/feedback/EmptyState"
import { IMAGES } from "@/constants/images"
import { MAIN_TEXTS } from "@/constants/texts/main.texts"

/** Página de erro 404 - Não Encontrado. */
export default function NotFoundPage() {
  return (
    <PrivateLayout>
      <EmptyState title={MAIN_TEXTS.notFound.title} message={Object.values(MAIN_TEXTS.notFound.message)} image={IMAGES.illustrations.notFound} />
    </PrivateLayout>
  )
}
