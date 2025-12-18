import config from "@/src/lib/config"
import { FirebaseOptions, initializeApp } from "firebase/app"
import { getAuth } from "firebase/auth"
import { getFirestore } from "firebase/firestore"

/**
 * Configuração do Firebase.
 * Carrega as informações de conexão nas variáveis de ambiente.
 */
const FirebaseConfig: FirebaseOptions = {
  apiKey: config.env.firebase.apiKey,
  authDomain: config.env.firebase.authDomain,
  projectId: config.env.firebase.projectId,
  storageBucket: config.env.firebase.storageBucket,
  messagingSenderId: config.env.firebase.messagingSenderId,
  appId: config.env.firebase.appId,
}

// Inicializar o Firebase
/** Instância do aplicativo Firebase. */
export const firebaseApp = initializeApp(FirebaseConfig)

// Iniciar serviços do Firebase
/** Instância do serviço Firebase Authentication. */
export const auth = getAuth(firebaseApp)
/** Instância do serviço Firestore. */
export const firestore = getFirestore(firebaseApp)
