import { HugeiconsIcon, IconSvgElement } from "@hugeicons/react"

/** Props de `HeaderWithTitleAndButton`. */
interface Props {
  /** Título do cabeçalho. */
  title: string
  /** Ícone no início do título. */
  icon?: IconSvgElement

  /** Botão no final. */
  children?: React.ReactNode
}

/** Cabeçalho de página com título e botão. */
export default function HeaderWithTitleAndButton({ title, icon, children }: Props) {
  return (
    <header className="flex flex-col sm:flex-row gap-4 justify-between items-center">
      <div className="flex flex-row items-center gap-2">
        {icon && <HugeiconsIcon icon={icon} className="size-8" />}
        <h2 className="font-semibold text-3xl">{title}</h2>
      </div>

      {children}
    </header>
  )
}
