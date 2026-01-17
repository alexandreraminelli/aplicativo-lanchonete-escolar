const ILLUSTRATIONS_PATH = "/images/illustrations"
const LOGOS_PATH = "/logos"

/** Constantes de path de rotas da aplicação. */
export const IMAGES = {
  // Logos
  logos: {
    favicon: `${LOGOS_PATH}/favicon.svg`,
    full: {
      white: `${LOGOS_PATH}/logo-white.svg`,
      black: `${LOGOS_PATH}/logo-black.svg`,
    },
    branding: {
      white: `${LOGOS_PATH}/branding-white.svg`,
      black: `${LOGOS_PATH}/branding-black.svg`,
    },
  },

  // Ilustrações
  illustrations: {
    accessDenied: `${ILLUSTRATIONS_PATH}/access-denied.svg`,
    addUser: `${ILLUSTRATIONS_PATH}/add-user.svg`,
    cafeteria: `${ILLUSTRATIONS_PATH}/cafeteria.svg`,
    empty: `${ILLUSTRATIONS_PATH}/empty.svg`,
    notFound: `${ILLUSTRATIONS_PATH}/not-found.svg`,
    schoolUnit: `${ILLUSTRATIONS_PATH}/school-unit.svg`,
  },

  // Página de login
  loginBg: "/images/photos/login-bg.jpg",
} as const
