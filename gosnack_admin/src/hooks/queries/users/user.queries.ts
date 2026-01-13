import { useQuery } from "@tanstack/react-query"
import { userKeys } from "./user.keys"
import { UserRepository } from "@/lib/firebase/firestore/repositories/users.repository"

/** Hook para buscar todos os usuários. */
export function useUsers() {
  return useQuery({
    queryKey: userKeys.all,
    queryFn: async () => UserRepository.findAll(),
  })
}
