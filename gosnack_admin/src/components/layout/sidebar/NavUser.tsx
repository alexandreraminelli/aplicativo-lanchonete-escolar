import { useAuth } from "@/src/components/providers/auth-provider"
import { Avatar, AvatarFallback, AvatarImage } from "@/src/components/ui/avatar"
import { DropdownMenu, DropdownMenuContent, DropdownMenuItem, DropdownMenuLabel, DropdownMenuSeparator, DropdownMenuTrigger } from "@/src/components/ui/dropdown-menu"
import { SidebarMenu, SidebarMenuButton, SidebarMenuItem } from "@/src/components/ui/sidebar"
import { AUTH_TEXTS } from "@/src/constants/texts/auth.texts"
import { signOutUser } from "@/src/lib/firebase/auth/auth"
import { UserModel } from "@/src/types/users/user.model"
import { User } from "firebase/auth"
import { ChevronUpIcon, LogOutIcon } from "lucide-react"

/** Botão no sidebar que mostra o nome do usuário e opções de rotas para gerenciar a conta. */
export default function NavUser() {
  // TODO: obter informações do usuário
  const { user, userData } = useAuth()

  return (
    <SidebarMenu>
      <SidebarMenuItem>
        <DropdownMenu>
          <DropdownMenuTrigger asChild>
            {/* Botão */}
            <SidebarMenuButton tooltip={`${user?.displayName} (${user?.email})`} size="lg" className="data-[state=open]:bg-sidebar-accent data-[state=open]:text-sidebar-accent-foreground">
              {/* Avatar, nome e e-mail */}
              <UserTile user={user!} userData={userData!} />

              {/* Seta */}
              <ChevronUpIcon className="ml-auto size-4" />
            </SidebarMenuButton>
          </DropdownMenuTrigger>

          {/* Opções ao clicar no botão de usuário */}
          <DropdownMenuContent className="w-(--radix-dropdown-menu-trigger-width) min-w-56 rounded-lg" side="bottom" align="end" sideOffset={4}>
            <DropdownMenuLabel className="p-0 font-normal">
              <div className="flex items-center gap-2 px-1 py-1.5 text-left text-sm">
                <UserTile user={user!} userData={userData!} />
              </div>
            </DropdownMenuLabel>

            <DropdownMenuSeparator />

            {/* Botão de logout */}
            <DropdownMenuItem
              variant="destructive"
              onClick={() => {
                signOutUser()
              }}
            >
              <LogOutIcon /> {AUTH_TEXTS.signOut}
            </DropdownMenuItem>
          </DropdownMenuContent>
        </DropdownMenu>
      </SidebarMenuItem>
    </SidebarMenu>
  )
}

/** Tile com avatar, nome do usuário e e-mail. */
function UserTile({ user, userData }: { user: User; userData: UserModel }) {
  return (
    <>
      <Avatar className="size-8 rounded-lg">
        {/* TODO: Imagem de avatar */}
        <AvatarImage src={""} alt={""} />
        {/* Iniciais */}
        <AvatarFallback className="rounded-lg">{`${userData.firstName.charAt(0)}${userData.lastName.charAt(0)}`}</AvatarFallback>
      </Avatar>

      {/* Info */}
      <div className="grid flex-1 text-left text-sm leading-tight">
        {/* TODO: Nome do usuário */}
        <span className="truncate font-medium">{user?.displayName}</span>
        {/* TODO: E-mail do usuário */}
        <span className="truncate text-xs">{userData?.email}</span>
      </div>
    </>
  )
}
