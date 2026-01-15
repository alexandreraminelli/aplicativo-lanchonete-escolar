import * as admin from "firebase-admin"

// Inicializa o Firebase Admin SDK, se ainda não estiver inicializado
if (!admin.apps.length) {
  admin.initializeApp()
}

/** Instância do serviço de autenticação do Firebase Admin. */
export const auth = admin.auth()

/** Instância do serviço Firestore do Firebase Admin. */
export const firestore = admin.firestore()
