// Helpers para variáveis de ambiente no .env

/**
 *  Obtêm uma variável de ambiente no arquivo `.env` ou `.env.local`.
 * Lança uma exceção se ela estiver ausente.
 */
export const getEnv = (key: string): string => {
  const value = process.env[key]
  // Se variável estiver ausente
  if (!value || "") {
    throw new Error(`Missing environment variable: ${key}.\nCheck if your .env file matches the .env.example file.`)
  }
  return value
}
