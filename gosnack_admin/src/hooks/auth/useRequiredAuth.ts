"use client"

import { ROUTES } from "@/constants/navigation/routes"
import { auth } from "@/lib/firebase/clientApp"
import { onAuthStateChanged } from "firebase/auth"
import { useRouter } from "next/navigation"
import { useEffect, useState } from "react"

/**
 * Hook para verificar se o usuário está autenticado.
 *
 * Redireciona o usuário para a página de login se não estiver autenticado.
 *
 * @return {boolean} isLoading - Indica se a verificação de autenticação está em andamento.
 */
export function useRequiredAuth() {
  const router = useRouter() // hook de navegação do Next.js
  const [isLoading, setIsLoading] = useState(true) // estado do carregamento do Firebase Auth

  useEffect(
    () => {
      const unsubscribe = onAuthStateChanged(auth, (user) => {
        if (!user) {
          // Se usuário não autenticado
          router.push(ROUTES.login) // Redirecionar para a página de login
        } else {
          // Se usuário autenticado
          setIsLoading(false)
        }
      })
      return () => unsubscribe() // Limpar o observador ao desmontar o componente
    },
    [router] // dependências do useEffect
  )

  return isLoading
}
