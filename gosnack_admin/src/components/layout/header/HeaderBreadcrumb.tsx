import { Breadcrumb, BreadcrumbItem, BreadcrumbLink, BreadcrumbList, BreadcrumbPage, BreadcrumbSeparator } from "@/components/ui/breadcrumb"
import { extractParams, matchBreadcrumb } from "@/constants/navigation/breadcrumb.utils"
import { MAIN_TEXTS } from "@/constants/texts/main.texts"
import { useCafeteriaName } from "@/hooks/queries/cafeterias/cafeteria.queries"
import Link from "next/link"
import { usePathname } from "next/navigation"

/**
 * Breadcrumb do Header.
 */
export default function HeaderBreadcrumb() {
  /** Rota atual. */
  const pathname = usePathname()

  /** Correspondência do breadcrumb para a rota atual. */
  const match = matchBreadcrumb(pathname)
  /** Parâmetros da rota (opcional). */
  const { unitId, cafeteriaId } = match ? extractParams(match.match, ["unitId", "cafeteriaId"]) : { unitId: undefined, cafeteriaId: undefined }

  const cafeteriaName = useCafeteriaName(unitId, cafeteriaId)

  if (!match) return null

  /** Itens do breadcrumb. */
  const { config } = match

  return (
    <Breadcrumb className="max-sm:hidden">
      <BreadcrumbList>
        {/* Construir segmento do breadcrumb */}
        {config.segments.map((segment, index) => {
          // Se o segmento for o último
          const isLast = index === config.segments.length - 1

          // Rótulo e link do segmento
          const params = { unitId: unitId ?? "", cafeteriaId: cafeteriaId ?? "" }
          let label = typeof segment.label === "function" ? segment.label(params) : segment.label
          const resolvedHref = typeof segment.href === "function" ? segment.href(params) : segment.href

          // Resolver labels dinâmicos
          if (label === "__CAFETERIA_NAME__") {
            label = cafeteriaName ?? MAIN_TEXTS.entities.cafeteria
          }

          return (
            <>
              <BreadcrumbItem key={index}>
                {!isLast && resolvedHref ? (
                  // Item com link
                  <BreadcrumbLink asChild>
                    <Link href={resolvedHref}>{label}</Link>
                  </BreadcrumbLink>
                ) : (
                  <BreadcrumbPage>{label}</BreadcrumbPage>
                )}
              </BreadcrumbItem>

              {/* Separator (exceto no último) */}
              {!isLast && <BreadcrumbSeparator />}
            </>
          )
        })}
      </BreadcrumbList>
    </Breadcrumb>
  )
}
