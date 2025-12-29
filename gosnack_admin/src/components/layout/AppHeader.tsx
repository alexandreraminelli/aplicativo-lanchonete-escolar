import { ModeToggle } from "@/src/components/layout/ModeToggle"
import { Breadcrumb, BreadcrumbItem, BreadcrumbLink, BreadcrumbList, BreadcrumbPage, BreadcrumbSeparator } from "@/src/components/ui/breadcrumb"
import { Separator } from "@/src/components/ui/separator"
import { SidebarTrigger } from "@/src/components/ui/sidebar"

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
        <Breadcrumb className="max-sm:hidden w-full">
          <BreadcrumbList>
            <BreadcrumbItem>
              <BreadcrumbLink href="#">Building Your Application</BreadcrumbLink>
            </BreadcrumbItem>
            <BreadcrumbSeparator />
            <BreadcrumbItem>
              <BreadcrumbPage>Data Fetching</BreadcrumbPage>
            </BreadcrumbItem>
          </BreadcrumbList>
        </Breadcrumb>

        <Separator orientation="vertical" className="mx-2" />

        {/* Botão de tema */}
        <ModeToggle />
      </div>
    </header>
  )
}
