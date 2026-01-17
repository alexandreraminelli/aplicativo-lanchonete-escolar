import Image from "next/image"

/** Props de `FormWithImageLayout`. */
interface Props {
  /** URL da imagem. */
  image: string
  /** Descrição da imagem. */
  alt?: string

  /** Título do formulário. */
  title: string
  /** Conteúdo do formulário. */
  children: React.ReactNode
}

/** Layout de formulário com uma imagem ao lado. */
export default function FormWithImageLayout({ image, alt = "", title, children }: Props) {
  return (
    <div className="flex flex-row gap-10 justify-around">
      <main className="space-y-6 w-full max-w-xl">
        <h2 className="font-semibold text-3xl md:text-4xl text-center md:text-start">{title}</h2>
        {/* Form */}
        {children}
      </main>

      {/* Imagem */}
      <aside className=" max-md:hidden max-w-2/5 self-start mt-10 sticky top-20 transition-all">
        <Image src={image} alt={alt} width={752} height={556} className="object-cover" />
      </aside>
    </div>
  )
}
