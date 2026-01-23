import { NAV_TEXTS } from "@/constants/texts/navigation.texts"
import { BreadcrumbConfig } from "@/types/navigation/breadcrumb"
import { ROUTES } from "./routes"
import { MAIN_TEXTS } from "../texts/main.texts"
import { CAFETERIA_TEXTS } from "../texts/cafeteria.texts"

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
  // Início: /
  { pattern: /^\/$/, segments: [{ label: NAV_TEXTS.mainPages.home }] },

  // ------------------------------------------------------------------------ //
  // Unidades: /unidades
  { pattern: /^\/unidades$/, segments: [HOME_SEGMENT, { label: MAIN_TEXTS.entities.units }] },

  // ------------------------------------------------------------------------ //
  // Lanchonetes: /lanchonetes
  { pattern: /^\/lanchonetes$/, segments: [HOME_SEGMENT, { label: MAIN_TEXTS.entities.cafeterias }] },

  // Adicionar Lanchonete: /lanchonetes/adicionar
  { pattern: /^\/lanchonetes\/adicionar$/, segments: [...COMMON_SEGMENTS.cafeterias, { label: CAFETERIA_TEXTS.actions.add }] },

  // Detalhes da Lanchonete: /lanchonetes/[unitId]/[cafeteriaId]
  {
    pattern: /^\/lanchonetes\/([^/]+)\/([^/]+)$/,
    segments: [
      ...COMMON_SEGMENTS.cafeterias,
      {
        label: "__CAFETERIA_NAME__", // Placeholder para nome da lanchonete
      },
    ],
  },
]
