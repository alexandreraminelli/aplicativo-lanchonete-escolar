import { setGlobalOptions } from "firebase-functions"

// Configurações globais para as funções do Firebase
setGlobalOptions({
  maxInstances: 10, // Número máximo de instâncias da função
})

// Exportar cloud functions
export * from "./users/create-user.function"
export * from "./users/users.functions"
