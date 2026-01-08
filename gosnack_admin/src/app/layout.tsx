import { ThemeProvider } from "@/components/providers/theme-provider"
import { APP_METADATA } from "@/constants/metadata"
import "@/styles/globals.css" // estilos CSS
import type { Metadata } from "next"
import { Figtree } from "next/font/google" // fonte
import { Toaster } from "sonner"
import { AuthProvider } from "@/components/providers/auth-provider"

/**
 * Fonte padrão do app: Figtree.
 */
const figtree = Figtree({
  weight: ["300", "400", "500", "600", "700", "800", "900"],
  subsets: ["latin"],
})

/**
 * Metadados gerais da aplicação.
 */
export const metadata: Metadata = {
  title: {
    template: APP_METADATA.template,
    default: APP_METADATA.title,
  },
  description: APP_METADATA.description,
}

/**
 * Layout raiz da aplicação.
 */
export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode
}>) {
  return (
    <html
      lang="pt-br" // idioma do site
      suppressHydrationWarning // suprime avisos de hidratação
    >
      <body className={`${figtree.className} antialiased h-dvh`}>
        <AuthProvider>
          <ThemeProvider
            attribute="class" // usar classes CSS para controlar o tema
            defaultTheme="system" // padrão: corresponder ao tema do SO
            enableSystem // detecção automática do tema do SO
            disableTransitionOnChange // desabilitar animações (evitar flashes e tornar mudança mais suave)
          >
            {/* Componente filho */}
            {children}
            {/* Sonner/Toast para notificações */}
            <Toaster richColors theme="system" position="top-right" />
          </ThemeProvider>
        </AuthProvider>
      </body>
    </html>
  )
}
