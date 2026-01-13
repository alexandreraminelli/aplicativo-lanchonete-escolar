import { Add01Icon, ArrowDown01Icon, ArrowLeft01Icon, ArrowRight01Icon, ArrowUp01Icon, ComputerIcon, Delete02Icon, Edit04Icon, HashtagIcon, Home09Icon, Loading03Icon, LoginSquare01Icon, LogoutSquare01Icon, Moon02Icon, Restaurant02Icon, SchoolIcon, Sun03Icon, UserGroup03Icon, ViewIcon, ViewOffSlashIcon } from "@hugeicons/core-free-icons"

/** Ícones usados na aplicação para cada contexto e entidade. */
export const ICONS = {
  actions: {
    create: Add01Icon,
    delete: Delete02Icon,
    edit: Edit04Icon,

    loading: Loading03Icon,
  },

  arrows: {
    up: ArrowUp01Icon,
    down: ArrowDown01Icon,
    left: ArrowLeft01Icon,
    right: ArrowRight01Icon,
  },

  auth: {
    login: LoginSquare01Icon,
    logout: LogoutSquare01Icon,

    password: {
      show: ViewIcon,
      hide: ViewOffSlashIcon,
    },
  },

  entities: {
    unit: SchoolIcon,
    cafeteria: Restaurant02Icon,
  },

  id: HashtagIcon,

  pages: {
    home: Home09Icon,
  },

  theme: {
    light: Sun03Icon,
    dark: Moon02Icon,
    system: ComputerIcon,
  },

  users: {
    all: UserGroup03Icon,
  },
} as const
