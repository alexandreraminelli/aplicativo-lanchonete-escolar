"use client"

import { Button } from "@/components/ui/button"
import { DropdownMenu, DropdownMenuContent, DropdownMenuItem, DropdownMenuLabel, DropdownMenuTrigger } from "@/components/ui/dropdown-menu"
import { ComputerIcon, Moon02Icon, Sun03Icon } from "@hugeicons/core-free-icons"
import { HugeiconsIcon, IconSvgElement } from "@hugeicons/react"
import { useTheme } from "next-themes"

/** Ícone do modo claro. */
const LIGHT_THEME_ICON = Sun03Icon
/** Ícone do modo escuro. */
const DARK_THEME_ICON = Moon02Icon

/** Tipagem do array de opções de tema. */
interface ThemeOptionType {
  label: string
  value: string
  icon: IconSvgElement
}

/** Botão de alternar o tema claro e escuro. */
export function ModeToggle() {
  // Controle do estado do tema
  const { theme, setTheme, resolvedTheme } = useTheme()

  const themeOptions: ThemeOptionType[] = [
    { label: "Sistema", value: "system", icon: ComputerIcon },
    { label: "Claro", value: "light", icon: LIGHT_THEME_ICON },
    { label: "Escuro", value: "dark", icon: DARK_THEME_ICON },
  ]

  return (
    <DropdownMenu>
      <DropdownMenuTrigger asChild>
        <Button variant="outline" size="icon">
          {/* Ícone */}
          <HugeiconsIcon icon={theme === "light" || resolvedTheme === "light" ? LIGHT_THEME_ICON : DARK_THEME_ICON} className="absolute h-7 w-7" />

          <span className="sr-only">Alterar tema</span>
        </Button>
      </DropdownMenuTrigger>

      <DropdownMenuContent align="end" className="space-y-0.5">
        <DropdownMenuLabel>Tema</DropdownMenuLabel>
        {/* Opções de tema */}
        {themeOptions.map((option) => (
          <DropdownMenuItem
            key={option.value}
            onClick={() => setTheme(option.value)} // aplicar tema
            className={theme === option.value ? "bg-accent/75" : ""} // destacar tema ativo
          >
            {/* Ícone e texto */}
            <HugeiconsIcon icon={option.icon} />
            {option.label}
          </DropdownMenuItem>
        ))}
      </DropdownMenuContent>
    </DropdownMenu>
  )
}
