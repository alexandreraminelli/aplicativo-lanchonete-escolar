import { ROUTES } from "@/src/constants/routes"
import { firebaseApp } from "@/src/lib/firebase/clientApp"
import { getAuth } from "firebase/auth"
import { redirect } from "next/navigation"

/**
 * Layout das páginas privadas.
 * Acessíveis apenas após a autenticação.
 */
export default function PrivateLayout({ children }: { children: React.ReactNode }) {
  const auth = getAuth(firebaseApp) // instância do serviço Auth

  if (!auth.currentUser) {
    // redirecionar funcionários não autenticados para a página de login
    redirect(ROUTES.login)
  }

  // Componente principal
  return <>{children}</>
}
