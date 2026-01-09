"use client"

import { QueryClient, QueryClientProvider } from "@tanstack/react-query"
import { ReactNode, useState } from "react"

/** Props de `QueryProvider`. */
interface Props {
  children: ReactNode
}

/** Provedor do React Query. */
export function QueryProvider({ children }: Props) {
  /** Instância do QueryClient para gerenciar o cache e as queries do React Query. */
  const [queryClient] = useState(
    () =>
      new QueryClient({
        // Configurações padrão para queries
        defaultOptions: {
          queries: {
            staleTime: 1000 * 60 * 5, // Tempo que os dados são considerados "frescos": 5 minutos
            refetchOnWindowFocus: false, // Não refazer a busca ao focar a janela
            retry: 1, // Número de tentativas em caso de falha
          },
        },
      })
  )

  return <QueryClientProvider client={queryClient}>{children}</QueryClientProvider>
}
