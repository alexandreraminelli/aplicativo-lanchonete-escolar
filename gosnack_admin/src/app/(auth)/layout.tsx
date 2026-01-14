"use client"

import FullScreenLoaderCircle from "@/components/common/loader/FullScreenLoaderCircle"
import Logo from "@/components/common/logos/Logo"
import { ModeToggle } from "@/components/layout/header/ModeToggle"
import { Card, CardContent } from "@/components/ui/card"
import { IMAGES } from "@/constants/images"
import { useRedirectIfAuth } from "@/hooks/auth/useRedirectIfAuth"
import Image from "next/image"

/**
 * Layout de autenticação.
 */
export default function AuthLayout({ children }: { children: React.ReactNode }) {
  // Redirecionar usuários autenticados
  const isLoading = useRedirectIfAuth()

  // Tela de carregamento
  if (isLoading) return <FullScreenLoaderCircle />

  // Componente principal
  return (
    <div
      className="bg-muted min-h-svh
        flex flex-col items-center justify-center
        p-6 md:p-10 pt-0! gap-4"
    >
      {/* Header */}
      <header className="flex flex-row items-center gap-8">
        <Logo />
        <ModeToggle />
      </header>

      {/* Card Central */}
      <div className="w-full max-w-sm md:max-w-4xl">
        <div className="flex flex-col gap-6">
          <Card className="overflow-hidden p-0 min-h-96">
            <CardContent className="grid p-0 md:grid-cols-2 h-full">
              {/* Página */}
              <div className="p-6 md:p-8">{children}</div>

              {/* Imagem */}
              <aside className="bg-muted relative hidden md:block min-h-96">
                <Image
                  src={IMAGES.loginBg}
                  alt="Cantina escolar"
                  // Ajustar imagem
                  fill
                  className="object-cover"
                />
              </aside>
            </CardContent>
          </Card>
        </div>
      </div>
    </div>
  )
}
