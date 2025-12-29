"use client"

import { ROUTES } from "@/src/constants/routes"
import { auth } from "@/src/lib/firebase/clientApp"
import { onAuthStateChanged } from "firebase/auth"
import { useRouter } from "next/navigation"
import { useEffect, useState } from "react"
import { LoaderCircleIcon } from "lucide-react"

/**
 * Layout das páginas privadas.
 * Acessíveis apenas após a autenticação.
 */
export default function PrivateLayout({ children }: { children: React.ReactNode }) {
  const router = useRouter()
  const [isLoading, setIsLoading] = useState(true)

  // Obter usuário e controlar acesso as rotas públicas e privadas
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
    return (
      <div className="w-dvw h-dvh flex items-center justify-center">
        <LoaderCircleIcon className="animate-spin" />
      </div>
    )
  }

  // Componente principal
  return <>{children}</>
}
