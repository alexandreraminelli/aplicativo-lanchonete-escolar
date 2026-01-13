import { ICONS } from "@/constants/icons"
import { ROUTES } from "@/constants/navigation/routes"
import { NAV_TEXTS } from "@/constants/texts/navigation.texts"
import { MenuGroup } from "@/types/navigation/menu-group.types"

/** Menu de navegação principal do sidebar. */
export const SIDEBAR_MENU: MenuGroup[] = [
  // Visão Geral
  {
    label: NAV_TEXTS.overview,
    roles: ["admin", "manager", "employee"],
    items: [
      { label: NAV_TEXTS.home, href: ROUTES.home, icon: ICONS.pages.home, roles: ["admin", "manager", "employee"] }, // Início
    ],
  },

  // Unidades e lanchonetes
  {
    label: NAV_TEXTS.unitsAndSnackBars,
    roles: ["admin"],
    items: [
      { label: NAV_TEXTS.units, href: ROUTES.units, icon: ICONS.entities.unit, roles: ["admin"] }, // Unidades
      { label: NAV_TEXTS.snackBars, href: ROUTES.snackBars, icon: ICONS.entities.snackBar, roles: ["admin"] }, // Lanchonetes
    ],
  },

  // Usuários e Acessos
  {
    label: NAV_TEXTS.usersAndAccess,
    roles: ["admin"],
    items: [
      { label: NAV_TEXTS.users, href: ROUTES.users, icon: ICONS.users.all, roles: ["admin"] }, // Usuários
    ],
  },
]
