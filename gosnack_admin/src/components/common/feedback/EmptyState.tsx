import { IMAGES } from "@/src/constants/images"
import Image from "next/image"
import { Button } from "../../ui/button"
import { MAIN_TEXTS } from "@/src/constants/texts/main.texts"
import { HomeIcon } from "lucide-react"
import Link from "next/link"
import { ROUTES } from "@/src/constants/navigation/routes"

/** Props do componente `EmptyState`. */
interface EmptyStateProps {
  /** Título do aviso. */
  title: string
  /** Array com parágrafos da mensagem. */
  message: string[]
  /** Ilustração do erro. */
  image?: string
}

/** Mensagem para estados vazios, como página não encontrada e consulta sem resultados. */
export default function EmptyState({ title, message, image = IMAGES.illustrations.empty }: EmptyStateProps) {
  return (
    <section className="flex flex-col lg:flex-row items-center justify-center w-full gap-6 px-4 md:px-8 pt-6">
      {/* Ilustração */}
      <aside>
        <Image src={image} alt="" width={384} height={384} className="max-h-full" />
      </aside>

      <div className="flex flex-col items-center lg:items-start gap-4 md:gap-6">
        {/* Título */}
        <header>
          <h1 className="font-semibold text-center lg:text-start text-3xl lg:text-4xl">{title}</h1>
        </header>
        {/* Mensagem */}
        <main className="text-center lg:text-start space-y-1.5 text-base text-muted-foreground">
          {message.map((msg, index) => (
            <p key={index}>{msg}</p>
          ))}
        </main>

        {/* Botões */}

        <footer>
          {/* Voltar pro início */}
          <Button size="lg" asChild>
            <Link href={ROUTES.home}>
              <HomeIcon />
              {MAIN_TEXTS.actions.backToHome}
            </Link>
          </Button>
        </footer>
      </div>
    </section>
  )
}
