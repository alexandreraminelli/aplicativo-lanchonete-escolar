import { UserRepository } from "@/lib/firebase/firestore/repositories/users.repository"
import { UserListItem } from "@/types/users/user.list-item"
import { useQuery } from "@tanstack/react-query"
import { userKeys } from "./user.keys"

/** Hook para buscar todos os usuários. */
export function useUsers() {
  return useQuery<UserListItem[]>({
    queryKey: userKeys.all,
    queryFn: async () => UserRepository.findAll(),
  })
}
