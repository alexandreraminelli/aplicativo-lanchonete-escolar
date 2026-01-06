import { NAV_TEXTS } from "@/src/constants/texts/navigation.texts"
import { MenuGroup } from "@/src/types/navigation/menu-group.types"
import { HomeIcon, SchoolIcon, UserCog2Icon, UsersIcon, UtensilsIcon } from "lucide-react"
import { ROUTES } from "./routes"

/** Menu de navegação principal do sidebar. */
export const SIDEBAR_MENU: MenuGroup[] = [
  // Visão Geral
  {
    label: NAV_TEXTS.overview,
    roles: ["admin", "manager", "employee"],
    items: [
      { label: NAV_TEXTS.home, href: ROUTES.home, icon: HomeIcon, roles: ["admin", "manager", "employee"] }, // Início
    ],
  },

  // Unidades e lanchonetes
  {
    label: NAV_TEXTS.unitsAndSnackBars,
    roles: ["admin", "manager"],
    items: [
      { label: NAV_TEXTS.units, href: ROUTES.units, icon: SchoolIcon, roles: ["admin"] }, // Unidades
      { label: NAV_TEXTS.snackBars, href: ROUTES.snackBars, icon: UtensilsIcon, roles: ["admin", "manager"] }, // Lanchonetes
    ],
  },

  // Usuários e Acessos
  {
    label: NAV_TEXTS.usersAndAccess,
    roles: ["admin"],
    items: [
      { label: NAV_TEXTS.users, href: ROUTES.users, icon: UserCog2Icon, roles: ["admin"] }, // Usuários
    ],
  },
]
