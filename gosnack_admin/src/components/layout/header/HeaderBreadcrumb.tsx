import { Breadcrumb, BreadcrumbItem, BreadcrumbLink, BreadcrumbList, BreadcrumbPage, BreadcrumbSeparator } from "@/components/ui/breadcrumb"
import { ROUTES } from "@/constants/navigation/routes"
import { CAFETERIA_TEXTS } from "@/constants/texts/cafeteria.texts"
import { MAIN_TEXTS } from "@/constants/texts/main.texts"
import { NAV_TEXTS } from "@/constants/texts/navigation.texts"
import { USERS_TEXTS } from "@/constants/texts/users.texts"
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
    <>
      <BreadcrumbItem>
        <BreadcrumbLinkNext href={ROUTES.home}>{NAV_TEXTS.mainPages.home}</BreadcrumbLinkNext>
      </BreadcrumbItem>
      <BreadcrumbSeparator />
    </>
  ),

  cafeteriasLink: (
    <>
      <BreadcrumbItem>
        <BreadcrumbLinkNext href={ROUTES.cafeterias}>{MAIN_TEXTS.entities.cafeterias}</BreadcrumbLinkNext>
      </BreadcrumbItem>
      <BreadcrumbSeparator />
    </>
  ),
  usersLink: (
    <>
      <BreadcrumbItem>
        <BreadcrumbLinkNext href={ROUTES.users}>{MAIN_TEXTS.entities.users}</BreadcrumbLinkNext>
      </BreadcrumbItem>
      <BreadcrumbSeparator />
    </>
  ),
}

/** Lista de componentes de breadcrumb para cada rota. */
const breadcrumbByRoute: Record<string, ReactNode> = {
  // Home
  [ROUTES.home]: (
    <BreadcrumbList>
      <BreadcrumbPage>{NAV_TEXTS.mainPages.home}</BreadcrumbPage>
    </BreadcrumbList>
  ),
  // Unidades
  [ROUTES.units]: (
    <BreadcrumbList>
      {breadcrumbItems.homeLink}
      <BreadcrumbItem>
        <BreadcrumbPage>{MAIN_TEXTS.entities.units}</BreadcrumbPage>
      </BreadcrumbItem>
    </BreadcrumbList>
  ),
  // Lanchonetes
  [ROUTES.cafeterias]: (
    <BreadcrumbList>
      {breadcrumbItems.homeLink}
      <BreadcrumbItem>
        <BreadcrumbPage>{MAIN_TEXTS.entities.cafeterias}</BreadcrumbPage>
      </BreadcrumbItem>
    </BreadcrumbList>
  ),
  [ROUTES.newCafeteria]: (
    <BreadcrumbList>
      {breadcrumbItems.homeLink}
      {breadcrumbItems.cafeteriasLink}
      <BreadcrumbItem>
        <BreadcrumbPage>{CAFETERIA_TEXTS.actions.add}</BreadcrumbPage>
      </BreadcrumbItem>
    </BreadcrumbList>
  ),

  // Usuários
  [ROUTES.users]: (
    <BreadcrumbList>
      {breadcrumbItems.homeLink}
      <BreadcrumbItem>
        <BreadcrumbPage>{MAIN_TEXTS.entities.users}</BreadcrumbPage>
      </BreadcrumbItem>
    </BreadcrumbList>
  ),

  // Adicionar Usuários
  [ROUTES.addUsers]: (
    <BreadcrumbList>
      {breadcrumbItems.homeLink}
      {breadcrumbItems.usersLink}
      <BreadcrumbItem>
        <BreadcrumbPage>{USERS_TEXTS.actions.create}</BreadcrumbPage>
      </BreadcrumbItem>
    </BreadcrumbList>
  ),
}
