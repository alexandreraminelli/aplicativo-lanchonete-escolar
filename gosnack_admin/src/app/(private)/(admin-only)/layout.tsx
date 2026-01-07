"use client"

import AccessDeniedMessage from "@/src/components/common/feedback/AccessDeniedMessage"
import FullScreenLoaderCircle from "@/src/components/common/loader/FullScreenLoaderCircle"
import { useAuth } from "@/src/components/providers/auth-provider"

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
