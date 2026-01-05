import { useAuth } from "@/src/components/providers/auth-provider"
import { SidebarGroup, SidebarGroupContent, SidebarGroupLabel, SidebarMenu, SidebarMenuButton, SidebarMenuItem } from "@/src/components/ui/sidebar"
import { Skeleton } from "@/src/components/ui/skeleton"
import AdminNav from "./AdminNav"
import EmployeeNav from "./EmployeeNav"
import ManagerNav from "./ManagerNav"
import { ROUTES_TEXTS } from "@/src/constants/texts/routes.texts"
import Link from "next/link"
import { ROUTES } from "@/src/constants/navigation/routes"
import { HomeIcon } from "lucide-react"

/** Menu de navegação do sidebar. */
export default function NavSidebar() {
  return (
    <>
      {/* Destinos em comum */}
      <SidebarGroup>
        <SidebarGroupLabel>{ROUTES_TEXTS.overview}</SidebarGroupLabel>
        <SidebarGroupContent>
          <SidebarMenu>
            <SidebarMenuItem>
              <SidebarMenuButton asChild tooltip={ROUTES_TEXTS.home}>
                <Link href={ROUTES.home}>
                  <HomeIcon />
                  <span>{ROUTES_TEXTS.home}</span>
                </Link>
              </SidebarMenuButton>
            </SidebarMenuItem>
          </SidebarMenu>
        </SidebarGroupContent>
      </SidebarGroup>

      {/* Destinos para cada role */}
      <RoleMenu />
    </>
  )
}

/** Menu de navegação correspondente ao papel do usuário. */
function RoleMenu() {
  const { userData, loading } = useAuth() // informação do usuário

  // Skeleton durante carregamento
  if (loading || !userData) {
    return <RoleMenuSkeleton />
  }
  // Menu conforme o papel do usuário
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

/** Skeleton do `RoleMenu`. */
function RoleMenuSkeleton() {
  // TODO: skeleton do NavUser
  return <Skeleton className="w-28 h-96" />
}
