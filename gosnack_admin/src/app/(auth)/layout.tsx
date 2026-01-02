"use client"

import FullScreenLoaderCircle from "@/src/components/common/loader/FullScreenLoaderCircle"
import { useAuth } from "@/src/components/providers/auth-provider"
import { ROUTES } from "@/src/constants/routes"
import { useRouter } from "next/navigation"
import { useEffect } from "react"

/**
 * Layout de autenticação.
 */
export default function AuthLayout({ children }: { children: React.ReactNode }) {
  const router = useRouter()
  const { user, loading } = useAuth()

  // Redirecionar usuários autenticados para o dashboard
  useEffect(() => {
    if (!loading && user) {
      router.replace(ROUTES.dashboard)
    }
  }, [user, loading, router])

  // Tela de carregamento
  if (loading) {
    return <FullScreenLoaderCircle />
  }

  // Componente principal
  return <>{children}</>
}
