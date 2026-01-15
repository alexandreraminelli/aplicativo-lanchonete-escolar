"use client"

import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table"
import { AUTH_TEXTS } from "@/constants/texts/auth.texts"
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
      <Table>
        {/* Cabeçalho */}
        <TableHeader>
          <TableRow>
            <TableHead>{AUTH_TEXTS.fields.name}</TableHead>
            <TableHead>{AUTH_TEXTS.fields.email}</TableHead>
            <TableHead>{AUTH_TEXTS.fields.role}</TableHead>
            <TableHead>{AUTH_TEXTS.fields.status.label}</TableHead>
          </TableRow>
        </TableHeader>

        {/* Lista */}
        <TableBody>
          {users.map((user) => (
            <TableRow key={user.uid}>
              <TableCell>{user.fullName}</TableCell>
              <TableCell>{user.email}</TableCell>
              <TableCell>{AUTH_TEXTS.roles[user.role]}</TableCell>
              {/* TODO: usar badge */}
              <TableCell>{user.isActive ? AUTH_TEXTS.fields.status.active : AUTH_TEXTS.fields.status.inactive}</TableCell>
            </TableRow>
          ))}
        </TableBody>
      </Table>
    </>
  )
}
