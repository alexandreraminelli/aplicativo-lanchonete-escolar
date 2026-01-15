// Cloud Functions para usuários

import * as functions from "firebase-functions"
import { auth } from "../config/firebase"

/** Cloud Function para listas os usuários. */
export const listUsers = functions.https.onRequest(async (req, res) => {
  try {
    const users = await auth.listUsers(1000)

    res.status(200).json(
      users.users.map((user) => ({
        uid: user.uid,
        email: user.email,
        disabled: user.disabled,
      }))
    )
  } catch (error) {
    // Tratamento de erro
    console.error("Erro ao listar usuários:", error)
    res.status(500).json({ error: "Erro ao listar usuários." })
  }
})
