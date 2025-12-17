import { getEnv } from "../utils/helpers/env"

/**
 * Configurações do projeto.
 */
const config = {
  /** Variáveis de ambiente. */
  env: {
    firebase: {
      apiKey: getEnv("PUBLIC_FIREBASE_API_KEY"),
      authDomain: getEnv("PUBLIC_FIREBASE_AUTH_DOMAIN"),
      projectId: getEnv("PUBLIC_FIREBASE_PROJECT_ID"),
      storageBucket: getEnv("PUBLIC_FIREBASE_STORAGE_BUCKET"),
      messagingSenderId: getEnv("PUBLIC_FIREBASE_MESSAGING_SENDER_ID"),
      appId: getEnv("PUBLIC_FIREBASE_APP_ID"),
    },
  },
}
export default config
