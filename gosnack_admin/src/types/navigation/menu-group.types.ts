import { MenuItem } from "./menu-item.types"

/** Tipagem de grupos do menu de navegação. */
export interface MenuGroup {
  /** Nome do grupo. */
  label: string
  /** Items do grupo. */
  items: MenuItem[]
}
