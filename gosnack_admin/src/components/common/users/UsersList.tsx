"use client"

import { USERS_TEXTS } from "@/constants/texts/users.texts"
import { useUsers } from "@/hooks/queries/users/user.queries"
import { toast } from "sonner"

/** Lista de usuários no sistema. */
export default function UsersList() {
  // Buscar usuários usando React Query
  const { data: users = [], isLoading, isError } = useUsers()

  // TODO: Skeleton durante carregamento
  if (isLoading) return <p>Carregando Usuários...</p>

  // Mensagem de erro
  if (isError) {
    toast.error(USERS_TEXTS.errors.getAll.title, { description: USERS_TEXTS.errors.getAll.message })
  }

  return (
    <>
      {/* Quantidade de usuários */}
      <p className="text-muted-foreground mb-4">{USERS_TEXTS.quant(users.length)}</p>

      {/* Tabela de usuários */}
      <section>
        {users.map((user) => (
          <div className="bg-muted border-2 m-5 p-4 rounded-2xl" key={user.id}>
            <p>
              {user.firstName} {user.lastName}
            </p>
            <p>{user.email}</p>
            <p>Papel: {user.role}</p>
          </div>
        ))}
      </section>
    </>
  )
}
