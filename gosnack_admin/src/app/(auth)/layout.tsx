"use client"

import FullScreenLoaderCircle from "@/components/common/loader/FullScreenLoaderCircle"
import { useRedirectIfAuth } from "@/hooks/auth/useRedirectIfAuth"

/**
 * Layout de autenticação.
 */
export default function AuthLayout({ children }: { children: React.ReactNode }) {
  // Redirecionar usuários autenticados
  const isLoading = useRedirectIfAuth()

  // Tela de carregamento
  if (isLoading) return <FullScreenLoaderCircle />

  // Componente principal
  return <>{children}</>
}
