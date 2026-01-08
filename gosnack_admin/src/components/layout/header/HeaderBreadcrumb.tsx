import { Breadcrumb, BreadcrumbItem, BreadcrumbLink, BreadcrumbList, BreadcrumbPage, BreadcrumbSeparator } from "@/components/ui/breadcrumb"
import { ROUTES } from "@/constants/navigation/routes"
import { NAV_TEXTS } from "@/constants/texts/navigation.texts"
import Link from "next/link"
import { usePathname } from "next/navigation"
import { ComponentProps, ReactNode } from "react"

/** Breadcrumb do header. */
export default function HeaderBreadcrumb() {
  const pathname = usePathname() // obter o caminho atual
  // Obter breadcrumb correspondente ao caminho
  const content = breadcrumbByRoute[pathname] ?? <></>

  return <Breadcrumb className="max-sm:hidden">{content}</Breadcrumb>
}

/** BreadcrumbLink com o componente Link do Next.js */
function BreadcrumbLinkNext({ children, ...props }: ComponentProps<typeof Link>) {
  return (
    <BreadcrumbLink asChild>
      <Link {...props}>{children}</Link>
    </BreadcrumbLink>
  )
}

/** Lista de itens reutilizáveis do breadcrumb. */
const breadcrumbItems = {
  homeLink: (
    <BreadcrumbItem>
      <BreadcrumbLinkNext href={ROUTES.home}>{NAV_TEXTS.home}</BreadcrumbLinkNext>
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
