"use client"

import FullScreenLoaderCircle from "@/src/components/common/loader/FullScreenLoaderCircle"
import AppHeader from "@/src/components/layout/AppHeader"
import { AppSidebar } from "@/src/components/layout/sidebar/AppSidebar"
import { useAuth } from "@/src/components/providers/auth-provider"
import { SidebarProvider } from "@/src/components/ui/sidebar"
import { ROUTES } from "@/src/constants/routes"
import { useRouter } from "next/navigation"
import { useEffect } from "react"

/**
 * Layout das páginas privadas.
 * Acessíveis apenas após a autenticação.
 */
export default function PrivateLayout({ children }: { children: React.ReactNode }) {
  const router = useRouter()
  const { user, loading } = useAuth()

  // Redirecionar usuários não autenticados para o login
  useEffect(() => {
    if (!loading && !user) {
      router.replace(ROUTES.login)
    }
  }, [user, loading, router])

  // Tela de carregamento
  if (loading) {
    return <FullScreenLoaderCircle />
  }

  // Componente principal
  return (
    <div>
      <SidebarProvider className="flex flex-col">
        <AppHeader /> {/* Cabeçalho */}
        <div className="flex flex-1">
          <AppSidebar /> {/* Sidebar */}
          {children} {/* Conteúdo das páginas */}
        </div>
      </SidebarProvider>
    </div>
  )
}
