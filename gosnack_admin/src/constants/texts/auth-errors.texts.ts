import { AuthErrorCodes } from "firebase/auth"

type AuthErrorCode = (typeof AuthErrorCodes)[keyof typeof AuthErrorCodes]

/** Constantes de mensagens de erros de autenticação. */
export const AUTH_ERROR_MESSAGES: Partial<Record<AuthErrorCode, string>> = {
  // Erros gerais
  [AuthErrorCodes.INVALID_EMAIL]: "O e-mail fornecido não é válido. Verifique o formato e tente novamente.",

  // Erros de cadastro
  [AuthErrorCodes.EMAIL_EXISTS]: "O e-mail fornecido já está sendo usado por outra conta.",
  [AuthErrorCodes.WEAK_PASSWORD]: "A senha fornecida é muito fraca. Escolha uma senha mais forte e tente novamente.",

  // Erros de login
  [AuthErrorCodes.INVALID_LOGIN_CREDENTIALS]: "O e-mail ou senha fornecidos estão incorretos. Verifique e tente novamente.",
  [AuthErrorCodes.INVALID_PASSWORD]: "A senha fornecida está incorreta. Verifique e tente novamente.",
  [AuthErrorCodes.USER_DELETED]: "Não existe uma conta registrada com o e-mail fornecido.",
  [AuthErrorCodes.USER_DISABLED]: "Esta conta foi desativada. Entre em contato com o suporte para mais informações.",

  // Erros de status da conexão
  [AuthErrorCodes.USER_SIGNED_OUT]: "O usuário foi desconectado. Faça login novamente para continuar.",

  // Erros de conexão
  [AuthErrorCodes.NETWORK_REQUEST_FAILED]: "Falha na conexão de rede. Verifique sua conexão com a internet e tente novamente.",
} as const
