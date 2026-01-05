import { NAV_TEXTS } from "@/src/constants/texts/navigation.texts"
import { MenuGroup } from "@/src/types/navigation/menu-group.types"
import { HomeIcon } from "lucide-react"
import { ROUTES } from "./routes"

/** Menu de navegação principal do sidebar. */
export const SIDEBAR_MENU: MenuGroup[] = [
  {
    label: NAV_TEXTS.overview,
    items: [{ label: NAV_TEXTS.home, href: ROUTES.home, icon: HomeIcon, roles: ["admin", "manager", "employee"] }],
  },
]
