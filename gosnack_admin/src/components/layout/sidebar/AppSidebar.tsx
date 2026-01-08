import Logo from "@/components/common/logos/Logo"
import { Sidebar, SidebarContent, SidebarFooter, SidebarHeader, SidebarMenu, SidebarMenuButton, SidebarSeparator } from "@/components/ui/sidebar"
import { MAIN_TEXTS } from "@/constants/texts/main.texts"
import NavUser from "./NavUser"
import NavSidebar from "./NavSidebar"

/** Sidebar do aplicativo. */
export function AppSidebar() {
  return (
    <Sidebar variant="sidebar" collapsible="icon">
      {/* Header */}
      <AppSidebarHeader />

      <SidebarSeparator />

      {/* Content */}
      <SidebarContent>
        <NavSidebar />
      </SidebarContent>

      <SidebarSeparator />

      {/* Footer */}
      <SidebarFooter>
        <NavUser />
      </SidebarFooter>
    </Sidebar>
  )
}

/** Cabeçalho da sidebar.  */
function AppSidebarHeader() {
  return (
    <SidebarHeader className="h-16 flex items-center justify-center">
      <SidebarMenu>
        <SidebarMenuButton size="lg">
          <Logo variation="favicon" className="size-8" />
          <div className="grid flex-1 text-left text-sm leading-tight">
            <span className="truncate font-medium text-sm">{MAIN_TEXTS.appName}</span>
            <span className="truncate text-xs">{MAIN_TEXTS.collegeName}</span>
          </div>
        </SidebarMenuButton>
      </SidebarMenu>
    </SidebarHeader>
  )
}
