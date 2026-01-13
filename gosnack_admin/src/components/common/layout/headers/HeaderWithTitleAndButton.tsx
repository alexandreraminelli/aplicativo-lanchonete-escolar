/** Props de `HeaderWithTitleAndButton`. */
interface Props {
  /** Título do cabeçalho. */
  title: string

  /** Botão no final. */
  children: React.ReactNode
}

/** Cabeçalho de página com título e botão. */
export default function HeaderWithTitleAndButton({ title, children }: Props) {
  return (
    <header className="flex flex-col sm:flex-row gap-4 justify-between items-center">
      <h2 className="font-semibold text-3xl">{title}</h2>

      {children}
    </header>
  )
}
