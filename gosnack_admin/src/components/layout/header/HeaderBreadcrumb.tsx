import { Breadcrumb, BreadcrumbItem, BreadcrumbLink, BreadcrumbList, BreadcrumbPage, BreadcrumbSeparator } from "@/src/components/ui/breadcrumb"
import { ROUTES } from "@/src/constants/routes"
import { ROUTES_TEXTS } from "@/src/constants/texts/routes.texts"
import { usePathname } from "next/navigation"
import { ReactNode } from "react"

/** Breadcrumb do header. */
export default function HeaderBreadcrumb() {
  const pathname = usePathname() // obter o caminho atual
  // Obter breadcrumb correspondente ao caminho
  const content = breadcrumbByRoute[pathname] ?? <></>

  return <Breadcrumb className="max-sm:hidden">{content}</Breadcrumb>
}

/* 
<BreadcrumbList>
    <BreadcrumbItem>
        <BreadcrumbLink href="#">Building Your Application</BreadcrumbLink>
    </BreadcrumbItem>
    <BreadcrumbSeparator />
    <BreadcrumbItem>
        <BreadcrumbPage>Data Fetching</BreadcrumbPage>
    </BreadcrumbItem>
</BreadcrumbList> 
*/

/** Lista de componentes de breadcrumb para cada rota. */
const breadcrumbByRoute: Record<string, ReactNode> = {
  [ROUTES.home]: (
    <BreadcrumbList>
      <BreadcrumbPage>{ROUTES_TEXTS.home}</BreadcrumbPage>
    </BreadcrumbList>
  ),
}
