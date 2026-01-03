import { useAuth } from "@/src/components/providers/auth-provider"
import { Skeleton } from "@/src/components/ui/skeleton"
import AdminNav from "./AdminNav"
import EmployeeNav from "./EmployeeNav"
import ManagerNav from "./ManagerNav"

/** Menu de navegação da sidebar correspondente ao papel do usuário. */
export default function NavSidebar() {
  const { user, userData, loading } = useAuth() // informação do usuário

  // Skeleton durante carregamento
  if (loading || !user || !userData) {
    return <NavUserSkeleton />
  } else {
    // Renderizar menu de navegação correspondente ao papel do usuário
    switch (userData.role) {
      case "admin":
        return <AdminNav />
      case "manager":
        return <ManagerNav />
      case "employee":
        return <EmployeeNav />
      default:
        return <></>
    }
  }
}

/** Skeleton do `NavUser`. */
function NavUserSkeleton() {
  // TODO: skeleton do NavUser
  return <Skeleton className="w-28 h-96" />
}
