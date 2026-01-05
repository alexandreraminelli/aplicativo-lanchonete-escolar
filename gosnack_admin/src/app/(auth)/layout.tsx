"use client"

import FullScreenLoaderCircle from "@/src/components/common/loader/FullScreenLoaderCircle"
import { ROUTES } from "@/src/constants/navigation/routes"
import { auth } from "@/src/lib/firebase/clientApp"
import { onAuthStateChanged } from "firebase/auth"
import { useRouter } from "next/navigation"
import { useEffect, useState } from "react"

/**
 * Layout de autenticação.
 */
export default function AuthLayout({ children }: { children: React.ReactNode }) {
  const router = useRouter()
  const [isLoading, setIsLoading] = useState(true)

  // Redirecionar usuários autenticados para o dashboard
  useEffect(() => {
    // Observar mudanças no estado de autenticação
    const unsubscribe = onAuthStateChanged(auth, (user) => {
      if (user) {
        router.replace(ROUTES.home) // Redirecionar usuários autenticados
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
  return <>{children}</>
}
