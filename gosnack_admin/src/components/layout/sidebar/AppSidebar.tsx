import { Sidebar, SidebarContent, SidebarFooter } from "@/src/components/ui/sidebar"
import NavUser from "./NavUser"

/**  */
export function AppSidebar() {
  return (
    <Sidebar variant="sidebar" collapsible="icon">
      {/* Content */}
      <SidebarContent></SidebarContent>

      {/* Footer */}
      <SidebarFooter>
        <NavUser />
      </SidebarFooter>
    </Sidebar>
  )
}
