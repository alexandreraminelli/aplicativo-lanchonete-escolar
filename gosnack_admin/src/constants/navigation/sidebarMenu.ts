import { NAV_TEXTS } from "@/src/constants/texts/navigation.texts"
import { MenuGroup } from "@/src/types/navigation/menu-group.types"
import { ROUTES } from "./routes"
import { Home09Icon, Restaurant02Icon, SchoolIcon, UserGroup03Icon } from "@hugeicons/core-free-icons"

/** Menu de navegação principal do sidebar. */
export const SIDEBAR_MENU: MenuGroup[] = [
  // Visão Geral
  {
    label: NAV_TEXTS.overview,
    roles: ["admin", "manager", "employee"],
    items: [
      { label: NAV_TEXTS.home, href: ROUTES.home, icon: Home09Icon, roles: ["admin", "manager", "employee"] }, // Início
    ],
  },

  // Unidades e lanchonetes
  {
    label: NAV_TEXTS.unitsAndSnackBars,
    roles: ["admin", "manager"],
    items: [
      { label: NAV_TEXTS.units, href: ROUTES.units, icon: SchoolIcon, roles: ["admin"] }, // Unidades
      { label: NAV_TEXTS.snackBars, href: ROUTES.snackBars, icon: Restaurant02Icon, roles: ["admin", "manager"] }, // Lanchonetes
    ],
  },

  // Usuários e Acessos
  {
    label: NAV_TEXTS.usersAndAccess,
    roles: ["admin"],
    items: [
      { label: NAV_TEXTS.users, href: ROUTES.users, icon: UserGroup03Icon, roles: ["admin"] }, // Usuários
    ],
  },
]
