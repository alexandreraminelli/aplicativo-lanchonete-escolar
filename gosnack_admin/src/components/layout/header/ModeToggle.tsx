"use client"

import { Button } from "@/components/ui/button"
import { DropdownMenu, DropdownMenuContent, DropdownMenuItem, DropdownMenuLabel, DropdownMenuTrigger } from "@/components/ui/dropdown-menu"
import { ICONS } from "@/constants/icons"
import { HugeiconsIcon, IconSvgElement } from "@hugeicons/react"
import { useTheme } from "next-themes"

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
    // TODO: Usar constantes de textos
    { label: "Sistema", value: "system", icon: ICONS.theme.system },
    { label: "Claro", value: "light", icon: ICONS.theme.light },
    { label: "Escuro", value: "dark", icon: ICONS.theme.dark },
  ]

  return (
    <DropdownMenu>
      <DropdownMenuTrigger asChild>
        <Button variant="outline" size="icon">
          {/* Ícone */}
          <HugeiconsIcon icon={theme === "light" || resolvedTheme === "light" ? ICONS.theme.light : ICONS.theme.dark} className="absolute h-7 w-7" />

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
