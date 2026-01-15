import HeaderWithTitleAndButton from "@/components/common/layout/headers/HeaderWithTitleAndButton"
import UsersList from "@/components/common/users/UsersList"
import { Button } from "@/components/ui/button"
import { ICONS } from "@/constants/icons"
import { ROUTES } from "@/constants/navigation/routes"
import { USERS_TEXTS } from "@/constants/texts/users.texts"
import { HugeiconsIcon } from "@hugeicons/react"
import Link from "next/link"

/** Página para gerenciar usuários. */
export default function UsersPage() {
  return (
    <section className="space-y-4">
      {/* Header */}
      <HeaderWithTitleAndButton title={USERS_TEXTS.management} icon={ICONS.users.all}>
        {/* Botão de adicionar usuário */}
        <Button asChild>
          <Link href={ROUTES.addUsers}>
            <HugeiconsIcon icon={ICONS.actions.create} />
            {USERS_TEXTS.actions.create}
          </Link>
        </Button>
      </HeaderWithTitleAndButton>

      {/* Lista de usuários */}
      <main>
        <UsersList />
      </main>
    </section>
  )
}
