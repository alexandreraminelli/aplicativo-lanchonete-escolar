import HeaderWithTitleAndButton from "@/components/common/layout/headers/HeaderWithTitleAndButton"
import { Button } from "@/components/ui/button"
import { ICONS } from "@/constants/icons"
import { USERS_TEXTS } from "@/constants/texts/users.texts"
import { HugeiconsIcon } from "@hugeicons/react"

/** Página para gerenciar usuários. */
export default function UsersPage() {
  return (
    <section className="space-y-4">
      {/* Header */}
      <HeaderWithTitleAndButton title={USERS_TEXTS.management}>
        {/* Botão de adicionar usuário */}
        <Button>
          <HugeiconsIcon icon={ICONS.actions.create} />
          {USERS_TEXTS.actions.create}
        </Button>
      </HeaderWithTitleAndButton>
    </section>
  )
}
