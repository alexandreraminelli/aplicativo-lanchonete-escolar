"use client"

import { ROUTES } from "@/constants/navigation/routes"
import { auth } from "@/lib/firebase/clientApp"
import { onAuthStateChanged } from "firebase/auth"
import { useRouter } from "next/navigation"
import { useEffect, useState } from "react"

/**
 * Hook para redirecionar usuários autenticados para páginas privadas.
 *
 * @return {boolean} isLoading - Indica se a verificação de autenticação está em andamento.
 */
export function useRedirectIfAuth() {
  const router = useRouter() // hook de navegação do Next.js
  const [isLoading, setIsLoading] = useState(true) // estado do carregamento do Firebase Auth

  useEffect(
    () => {
      const unsubscribe = onAuthStateChanged(auth, (user) => {
        if (user) {
          // Se usuário está autenticado
          router.push(ROUTES.home) // Redirecionar para a página inicial
        } else {
          // Se usuário não está autenticado
          setIsLoading(false)
        }
      })
      return () => unsubscribe() // Limpar o observador ao desmontar o componente
    },
    [router] // dependências do useEffect
  )

  return isLoading
}
