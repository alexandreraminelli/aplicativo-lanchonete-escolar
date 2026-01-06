"use client"

import AccessDeniedMessage from "@/src/components/common/feedback/AccessDeniedMessage"
import EmptyState from "@/src/components/common/feedback/EmptyState"
import FullScreenLoaderCircle from "@/src/components/common/loader/FullScreenLoaderCircle"
import { useAuth } from "@/src/components/providers/auth-provider"
import { IMAGES } from "@/src/constants/images"
import { MAIN_TEXTS } from "@/src/constants/texts/main.texts"

/**
 * Layout para rotas acessíveis apenas por administradores.
 * Exibe uma mensagem de acesso negado.
 */
export default function AdminOnlyLayout({ children }: { children: React.ReactNode }) {
  const { userData, loading } = useAuth()

  // Tela de carregamento enquanto obtém os dados
  if (loading || !userData) {
    return <FullScreenLoaderCircle />
  }

  // Redirecionar quem não é admin
  if (userData?.role !== "admin") {
    return <AccessDeniedMessage />
  }

  return <>{children}</>
}
