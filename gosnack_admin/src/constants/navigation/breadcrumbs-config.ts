import { CAFETERIA_TEXTS } from "@/constants/texts/cafeteria.texts"
import { MAIN_TEXTS } from "@/constants/texts/main.texts"
import { NAV_TEXTS } from "@/constants/texts/navigation.texts"
import { BreadcrumbConfig } from "@/types/navigation/breadcrumb"
import { DYNAMIC_ROUTE_PATTERNS, STATIC_ROUTE_PATTERNS } from "./route-patterns"
import { ROUTES } from "./routes"

/** Segmento para home */
const HOME_SEGMENT = { label: NAV_TEXTS.mainPages.home, href: ROUTES.home }

/** Segmentos frequentemente utilizados. */
const COMMON_SEGMENTS = {
  cafeterias: [HOME_SEGMENT, { label: MAIN_TEXTS.entities.cafeterias, href: ROUTES.cafeterias }],
}

/**
 * Lista de breadcrumbs para as rotas da aplicação.
 */
export const BREADCRUMBS: BreadcrumbConfig[] = [
  // ------------------------------------------------------------------------ //
  // Início
  { pattern: STATIC_ROUTE_PATTERNS.home, segments: [{ label: NAV_TEXTS.mainPages.home }] },

  // ------------------------------------------------------------------------ //
  // Unidades
  { pattern: STATIC_ROUTE_PATTERNS.units, segments: [HOME_SEGMENT, { label: MAIN_TEXTS.entities.units }] },

  // ------------------------------------------------------------------------ //
  // Lanchonetes
  { pattern: STATIC_ROUTE_PATTERNS.cafeterias.main, segments: [HOME_SEGMENT, { label: MAIN_TEXTS.entities.cafeterias }] },

  // Adicionar Lanchonete: /lanchonetes/adicionar
  { pattern: STATIC_ROUTE_PATTERNS.cafeterias.add, segments: [...COMMON_SEGMENTS.cafeterias, { label: CAFETERIA_TEXTS.actions.add }] },

  // Detalhes da Lanchonete: /lanchonetes/[unitId]/[cafeteriaId]
  {
    pattern: DYNAMIC_ROUTE_PATTERNS.cafeterias.details,
    segments: [
      ...COMMON_SEGMENTS.cafeterias,
      {
        label: "__CAFETERIA_NAME__", // Placeholder para nome da lanchonete
      },
    ],
  },
]
