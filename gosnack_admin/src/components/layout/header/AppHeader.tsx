import { ModeToggle } from "@/components/layout/header/ModeToggle"
import { Separator } from "@/components/ui/separator"
import { SidebarTrigger } from "@/components/ui/sidebar"
import HeaderBreadcrumb from "./HeaderBreadcrumb"

/** Cabeçalho do aplicativo. */
export default function AppHeader() {
  return (
    <header className="bg-background/75 backdrop-blur sticky top-0 z-50 flex w-full items-center border-b">
      <div className="flex w-full items-center gap-2 px-4 h-16">
        {/* Botão de exibir/ocultar sidebar */}
        <SidebarTrigger size="icon" />

        <Separator orientation="vertical" className="mx-2" />

        {/* Breadcrumb */}
        <div className="w-full">
          <HeaderBreadcrumb />
        </div>

        {/* Botão de tema */}
        <ModeToggle />
      </div>
    </header>
  )
}
