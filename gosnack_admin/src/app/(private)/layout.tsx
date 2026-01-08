"use client"

import FullScreenLoaderCircle from "@/components/common/loader/FullScreenLoaderCircle"
import AppHeader from "@/components/layout/header/AppHeader"
import { AppSidebar } from "@/components/layout/sidebar/AppSidebar"
import { SidebarProvider } from "@/components/ui/sidebar"
import { useRequiredAuth } from "@/hooks/auth/useRequiredAuth"

/**
 * Layout das páginas privadas.
 * Acessíveis apenas após a autenticação.
 */
export default function PrivateLayout({ children }: { children: React.ReactNode }) {
  // Verificar se usuário está autenticado
  const isLoading = useRequiredAuth()

  // Tela de carregamento
  if (isLoading) return <FullScreenLoaderCircle />

  // Componente principal
  return (
    <div>
      <SidebarProvider className="flex flex-col">
        <div className="flex flex-1">
          <AppSidebar /> {/* Sidebar */}
          <div className="flex flex-col flex-1">
            <AppHeader /> {/* Cabeçalho */}
            <div className="px-4 pt-3.5">
              {children} {/* Conteúdo das páginas */}
            </div>
          </div>
        </div>
      </SidebarProvider>
    </div>
  )
}
