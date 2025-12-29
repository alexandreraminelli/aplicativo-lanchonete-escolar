import { ROUTES } from "@/src/constants/routes"
import { firebaseApp } from "@/src/lib/firebase/clientApp"
import { getAuth } from "firebase/auth"
import { redirect } from "next/navigation"

/**
 * Layout de autenticação.
 */
export default function AuthLayout({ children }: { children: React.ReactNode }) {
  const auth = getAuth(firebaseApp) // instância do serviço Auth

  if (auth.currentUser) {
    // redirecionar funcionários autenticados para o dashboard
    redirect(ROUTES.dashboard)
  }

  // Componente principal
  return <>{children}</>
}
