"use client"

import FullScreenLoaderCircle from "@/src/components/common/loader/FullScreenLoaderCircle"
import AppHeader from "@/src/components/layout/header/AppHeader"
import { AppSidebar } from "@/src/components/layout/sidebar/AppSidebar"
import { SidebarProvider } from "@/src/components/ui/sidebar"
import { ROUTES } from "@/src/constants/navigation/routes"
import { auth } from "@/src/lib/firebase/clientApp"
import { onAuthStateChanged } from "firebase/auth"
import { useRouter } from "next/navigation"
import { useEffect, useState } from "react"

/**
 * Layout das páginas privadas.
 * Acessíveis apenas após a autenticação.
 */
export default function PrivateLayout({ children }: { children: React.ReactNode }) {
  const router = useRouter()
  const [isLoading, setIsLoading] = useState(true)

  // Redirecionar usuários não autenticados para o login
  useEffect(() => {
    // Observar mudanças no estado de autenticação
    const unsubscribe = onAuthStateChanged(auth, (user) => {
      if (!user) {
        router.push(ROUTES.login) // Redirecionar usuários não autenticados
      } else {
        setIsLoading(false)
      }
    })
    return () => unsubscribe() // Limpar o observador ao desmontar o componente
  }, [router])

  // Tela de carregamento
  if (isLoading) {
    return <FullScreenLoaderCircle />
  }

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
