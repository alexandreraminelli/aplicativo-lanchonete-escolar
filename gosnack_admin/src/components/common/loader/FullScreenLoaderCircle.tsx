import { Loading03Icon } from "@hugeicons/core-free-icons"
import { HugeiconsIcon } from "@hugeicons/react"

/**
 * Indicador de carregamento em tela cheia.
 */
export default function FullScreenLoaderCircle() {
  return (
    <div className="w-full h-full flex items-center justify-center">
      <HugeiconsIcon icon={Loading03Icon} className="animate-spin" />
    </div>
  )
}
