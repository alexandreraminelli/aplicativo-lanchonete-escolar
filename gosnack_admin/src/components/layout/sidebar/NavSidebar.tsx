import { useAuth } from "@/components/providers/auth-provider"
import { SidebarGroup, SidebarGroupContent, SidebarGroupLabel, SidebarMenu, SidebarMenuButton, SidebarMenuItem } from "@/components/ui/sidebar"
import { SIDEBAR_MENU } from "@/constants/navigation/sidebar-menu"
import { HugeiconsIcon } from "@hugeicons/react"
import Link from "next/link"
import { usePathname } from "next/navigation"
import NavSidebarSkeleton from "./NavSidebarSkeleton"

/** Menu de navegação do sidebar. */
export default function NavSidebar() {
  const pathname = usePathname() // rota atual

  const { userData, loading } = useAuth() // dados do usuário

  // Skeleton durante carregamento
  if (loading || !userData) {
    return <NavSidebarSkeleton />
  }

  return (
    <>
      {SIDEBAR_MENU.map((group, index) => {
        if (group.roles.includes(userData.role)) {
          return (
            <SidebarGroup key={index}>
              <SidebarGroupLabel>{group.label}</SidebarGroupLabel>

              <SidebarGroupContent>
                <SidebarMenu>
                  {group.items.map((item, itemIndex) => {
                    // Verifica se item é permitido para o tipo de usuário
                    if (item.roles.includes(userData.role)) {
                      return (
                        <SidebarMenuItem key={itemIndex}>
                          <SidebarMenuButton
                            asChild
                            tooltip={item.label} // Tooltip para quando sidebar estiver colapsado
                            isActive={pathname === item.href} // Destaque para rota ativa
                          >
                            <Link href={item.href}>
                              {item.icon && <HugeiconsIcon icon={item.icon} />}
                              <span>{item.label}</span>
                            </Link>
                          </SidebarMenuButton>
                        </SidebarMenuItem>
                      )
                    } else {
                      return null
                    }
                  })}
                </SidebarMenu>
              </SidebarGroupContent>
            </SidebarGroup>
          )
        } else {
          return null
        }
      })}
    </>
  )
}
