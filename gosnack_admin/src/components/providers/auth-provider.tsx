"use client"

import { auth, firestore } from "@/lib/firebase/clientApp"
import { FirestoreCollections } from "@/lib/firebase/firestore/collections"
import { UserModel } from "@/types/users/user.model"
import { onAuthStateChanged, User } from "firebase/auth"
import { doc, getDoc } from "firebase/firestore"
import { createContext, useContext, useEffect, useState } from "react"

/** Tipagem do `AuthContext`. */
interface AuthContextType {
  user: User | null
  userData: UserModel | null
  loading: boolean
}

/**
 * Contexto de autenticação que fornece informações do usuário autenticado.
 */
const AuthContext = createContext<AuthContextType | undefined>(undefined)

/**
 * Provider de autenticação que gerencia o estado do usuário autenticado.
 */
export function AuthProvider({ children }: { children: React.ReactNode }) {
  /** Usuário do Firebase Auth. */
  const [user, setUser] = useState<User | null>(null)
  /** Dados do usuário no Firestore. */
  const [userData, setUserData] = useState<UserModel | null>(null)
  /** Estado de carregamento das informações de autenticação. */
  const [loading, setLoading] = useState<boolean>(true)

  useEffect(() => {
    // Observar mudanças no estado de autenticação
    const unsubscribe = onAuthStateChanged(auth, async (currentUser) => {
      setUser(currentUser)

      if (currentUser) {
        // Se houver usuário autenticado, buscar dados adicionais no Firestore
        try {
          // Obter DocumentReference do usuário
          const docRef = doc(firestore, FirestoreCollections.USERS, currentUser.uid)
          // Usar DocumentReferente para obter o documento do snapshot
          const docSnap = await getDoc(docRef)

          if (docSnap.exists()) {
            setUserData(docSnap.data() as UserModel)
          }
        } catch (error) {
          console.error("Erro ao buscar dados do usuário:", error)
        }
      } else {
        // Se não houver usuário, limpar dados do usuário
        setUserData(null)
      }

      setLoading(false) // Finalizar carregamento
    })

    return () => unsubscribe() // Limpar o observador ao desmontar o componente
  }, [])

  return <AuthContext.Provider value={{ user, userData, loading }}>{children}</AuthContext.Provider>
}

/**
 * Hook para acessar o contexto de autenticação.
 */
export function useAuth() {
  const context = useContext(AuthContext)
  if (context === undefined) {
    throw new Error("useAuth must be used within an AuthProvider")
  }
  return context
}
