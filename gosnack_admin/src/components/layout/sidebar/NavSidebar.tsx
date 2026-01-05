import { useAuth } from "@/src/components/providers/auth-provider"
import { SidebarGroup, SidebarGroupContent, SidebarGroupLabel, SidebarMenu, SidebarMenuButton, SidebarMenuItem } from "@/src/components/ui/sidebar"
import { SIDEBAR_MENU } from "@/src/constants/navigation/sidebarMenu"
import Link from "next/link"

/** Menu de navegação do sidebar. */
export default function NavSidebar() {
  const { userData, loading } = useAuth()

  // TODO: Skeleton durante carregamento
  if (loading || !userData) {
    return <p>Carregando dados</p>
  }

  return (
    <>
      {/* Destinos em comum */}
      {/* <SidebarGroup>
        <SidebarGroupLabel>{NAV_TEXTS.overview}</SidebarGroupLabel>
        <SidebarGroupContent>
          <SidebarMenu>
            
          </SidebarMenu>
        </SidebarGroupContent>
      </SidebarGroup> */}
      {SIDEBAR_MENU.map((group, index) => (
        <SidebarGroup key={index}>
          <SidebarGroupLabel>{group.label}</SidebarGroupLabel>

          <SidebarGroupContent>
            <SidebarMenu>
              {group.items.map((item, itemIndex) => {
                // Verifica se item é permitido para o tipo de usuário
                if (item.roles.includes(userData.role)) {
                  return (
                    <SidebarMenuItem key={itemIndex}>
                      <SidebarMenuButton asChild tooltip={item.label}>
                        <Link href={item.href}>
                          {item.icon && <item.icon />}
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
      ))}
    </>
  )
}
