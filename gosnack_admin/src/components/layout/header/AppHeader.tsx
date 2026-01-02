import { ModeToggle } from "@/src/components/layout/header/ModeToggle"
import { Separator } from "@/src/components/ui/separator"
import { SidebarTrigger } from "@/src/components/ui/sidebar"
import HeaderBreadcrumb from "./HeaderBreadcrumb"

/** Cabeçalho do aplicativo. */
export default function AppHeader() {
  return (
    <header className="bg-background sticky top-0 z-50 flex w-full items-center border-b">
      <div className="flex w-full items-center gap-2 px-4 h-16">
        {/* Botão de exibir/ocultar sidebar */}
        <SidebarTrigger size="icon-lg" className="size-8" />

        <Separator orientation="vertical" className="mx-2" />

        {/* Breadcrumb */}

        {/* TODO: passar componente como prop */}
        <HeaderBreadcrumb />

        <Separator orientation="vertical" className="mx-2" />

        {/* Botão de tema */}
        <ModeToggle />
      </div>
    </header>
  )
}
