import { LoaderCircleIcon } from "lucide-react"

/**
 * Indicador de carregamento em tela cheia.
 */
export default function FullScreenLoaderCircle() {
  return (
    <div className="w-full h-full flex items-center justify-center">
      <LoaderCircleIcon className="animate-spin" />
    </div>
  )
}
