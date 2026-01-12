"use client"

import EmptyState from "@/components/common/feedback/EmptyState"
import FullScreenLoaderCircle from "@/components/common/loader/FullScreenLoaderCircle"
import { Button } from "@/components/ui/button"
import { ICONS } from "@/constants/icons"
import { IMAGES } from "@/constants/images"
import { ROUTES } from "@/constants/navigation/routes"
import { MAIN_TEXTS } from "@/constants/texts/main.texts"
import { useRequiredAuth } from "@/hooks/auth/useRequiredAuth"
import { HugeiconsIcon } from "@hugeicons/react"
import Link from "next/link"
import PrivateLayout from "./(private)/layout"

/** Página de erro 404 - Não Encontrado. */
export default function NotFoundPage() {
  // Verificar se usuário está autenticado
  const isLoading = useRequiredAuth()

  // Tela de carregamento
  if (isLoading) return <FullScreenLoaderCircle />

  return (
    <PrivateLayout>
      <EmptyState title={MAIN_TEXTS.notFound.title} message={Object.values(MAIN_TEXTS.notFound.message)} image={IMAGES.illustrations.notFound}>
        {/* Voltar pro início */}
        <Button size="lg" asChild>
          <Link href={ROUTES.home}>
            <HugeiconsIcon icon={ICONS.pages.home} />
            {MAIN_TEXTS.actions.backToHome}
          </Link>
        </Button>
      </EmptyState>
    </PrivateLayout>
  )
}
