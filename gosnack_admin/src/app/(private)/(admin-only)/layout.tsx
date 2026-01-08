"use client"

import AccessDeniedMessage from "@/components/common/feedback/AccessDeniedMessage"
import FullScreenLoaderCircle from "@/components/common/loader/FullScreenLoaderCircle"
import { useAuth } from "@/components/providers/auth-provider"

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
