import { ICONS } from "@/constants/icons"
import { ROUTES } from "@/constants/navigation/routes"
import { MAIN_TEXTS } from "@/constants/texts/main.texts"
import { NAV_TEXTS } from "@/constants/texts/navigation.texts"
import { MenuGroup } from "@/types/navigation/menu-group.types"

/** Menu de navegação principal do sidebar. */
export const SIDEBAR_MENU: MenuGroup[] = [
  // Visão Geral
  {
    label: NAV_TEXTS.groups.overview,
    roles: ["admin", "manager", "employee"],
    items: [
      { label: NAV_TEXTS.mainPages.home, href: ROUTES.home, icon: ICONS.pages.home, roles: ["admin", "manager", "employee"] }, // Início
    ],
  },

  // Unidades e lanchonetes
  {
    label: NAV_TEXTS.groups.unitsAndCafeterias,
    roles: ["admin"],
    items: [
      { label: MAIN_TEXTS.entities.units, href: ROUTES.units, icon: ICONS.entities.unit, roles: ["admin"] }, // Unidades
      { label: MAIN_TEXTS.entities.cafeterias, href: ROUTES.cafeterias, icon: ICONS.entities.cafeteria, roles: ["admin"] }, // Lanchonetes
    ],
  },

  // Usuários e Acessos
  {
    label: NAV_TEXTS.groups.usersAndAccess,
    roles: ["admin"],
    items: [
      { label: MAIN_TEXTS.entities.users, href: ROUTES.users, icon: ICONS.users.all, roles: ["admin"] }, // Usuários
    ],
  },
]
