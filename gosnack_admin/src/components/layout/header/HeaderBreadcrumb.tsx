import { Breadcrumb, BreadcrumbItem, BreadcrumbLink, BreadcrumbList, BreadcrumbPage, BreadcrumbSeparator } from "@/src/components/ui/breadcrumb"
import { ROUTES } from "@/src/constants/navigation/routes"
import { NAV_TEXTS } from "@/src/constants/texts/navigation.texts"
import { usePathname } from "next/navigation"
import { ReactNode } from "react"

/** Breadcrumb do header. */
export default function HeaderBreadcrumb() {
  const pathname = usePathname() // obter o caminho atual
  // Obter breadcrumb correspondente ao caminho
  const content = breadcrumbByRoute[pathname] ?? <></>

  return <Breadcrumb className="max-sm:hidden">{content}</Breadcrumb>
}

/** Lista de itens reutilizáveis do breadcrumb. */
const breadcrumbItems = {
  homeLink: (
    <BreadcrumbItem>
      <BreadcrumbLink href={ROUTES.home}>{NAV_TEXTS.home}</BreadcrumbLink>
    </BreadcrumbItem>
  ),
}

/** Lista de componentes de breadcrumb para cada rota. */
const breadcrumbByRoute: Record<string, ReactNode> = {
  // Home
  [ROUTES.home]: (
    <BreadcrumbList>
      <BreadcrumbPage>{NAV_TEXTS.home}</BreadcrumbPage>
    </BreadcrumbList>
  ),
  // Unidades
  [ROUTES.units]: (
    <BreadcrumbList>
      {breadcrumbItems.homeLink}
      <BreadcrumbSeparator />
      <BreadcrumbItem>
        <BreadcrumbPage>{NAV_TEXTS.units}</BreadcrumbPage>
      </BreadcrumbItem>
    </BreadcrumbList>
  ),
}
