import { UserRole } from "@/src/types/users/user.types"
import { IconSvgElement } from "@hugeicons/react"

/** Tipagem do menu de navegação. */
export interface MenuItem {
  /** Rótulo do item. */
  label: string
  /** Destino do item. */
  href: string
  /** Ícone */
  icon?: IconSvgElement

  /** Para quais tipos de usuário o item será exibido. */
  roles: UserRole[]

  /** Itens aninhados. */
  items?: Pick<MenuItem, "label" | "href">[]
}
