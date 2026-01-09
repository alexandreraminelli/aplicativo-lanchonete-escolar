import { Empty, EmptyContent, EmptyDescription, EmptyHeader, EmptyMedia, EmptyTitle } from "@/components/ui/empty"
import { IMAGES } from "@/constants/images"
import Image from "next/image"
import { ReactNode } from "react"

/** Props do componente `EmptyState`. */
interface EmptyStateProps {
  /** Título do aviso. */
  title: string
  /** Array com parágrafos da mensagem. */
  message: string[]
  /** Ilustração do erro. */
  image?: string

  /** Conteúdo da mensagem (ex: botões). */
  children?: ReactNode
}

/** Mensagem para estados vazios, como página não encontrada e consulta sem resultados. */
export default function EmptyState({ title, message, image = IMAGES.illustrations.empty, children }: EmptyStateProps) {
  return (
    <Empty className="p-0">
      <EmptyHeader className="max-w-2xl">
        {/* Ilustração */}
        <EmptyMedia>
          <Image src={image} alt="" width={320} height={320} />
        </EmptyMedia>
        {/* Título */}
        <EmptyTitle className="text-2xl lg:text-3xl mb-2">{title}</EmptyTitle>
        {message.map((msg, index) => (
          <EmptyDescription key={index}>{msg}</EmptyDescription>
        ))}
      </EmptyHeader>

      {/* Botões de ação */}
      <EmptyContent>{children}</EmptyContent>
    </Empty>
  )
}
