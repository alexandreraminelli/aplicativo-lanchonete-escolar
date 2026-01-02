import { Sidebar, SidebarContent, SidebarFooter, SidebarSeparator } from "@/src/components/ui/sidebar"
import NavUser from "./NavUser"

/**  */
export function AppSidebar() {
  return (
    <Sidebar variant="sidebar" collapsible="icon">
      {/* Content */}
      <SidebarContent></SidebarContent>

      <SidebarSeparator />

      {/* Footer */}
      <SidebarFooter>
        <NavUser />
      </SidebarFooter>
    </Sidebar>
  )
}
