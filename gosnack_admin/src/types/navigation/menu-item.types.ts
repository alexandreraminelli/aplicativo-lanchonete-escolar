import { UserRole } from "@/src/types/users/user.types"
import { LucideIcon } from "lucide-react"

/** Tipagem do menu de navegação. */
export interface MenuItem {
  /** Rótulo do item. */
  label: string
  /** Destino do item. */
  href: string
  /** Ícone */
  icon?: LucideIcon

  /** Para quais tipos de usuário o item será exibido. */
  roles: UserRole[]

  /** Itens aninhados. */
  items?: Pick<MenuItem, "label" | "href">[]
}
