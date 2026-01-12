import { ICONS } from "@/constants/icons"
import { HugeiconsIcon } from "@hugeicons/react"

/**
 * Indicador de carregamento em tela cheia.
 */
export default function FullScreenLoaderCircle() {
  return (
    <div className="w-full h-full flex items-center justify-center">
      <HugeiconsIcon icon={ICONS.actions.loading} className="animate-spin size-10" />
    </div>
  )
}
