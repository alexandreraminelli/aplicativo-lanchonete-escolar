import { useAuth } from "@/components/providers/auth-provider"
import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar"
import { DropdownMenu, DropdownMenuContent, DropdownMenuItem, DropdownMenuLabel, DropdownMenuSeparator, DropdownMenuTrigger } from "@/components/ui/dropdown-menu"
import { SidebarMenu, SidebarMenuButton, SidebarMenuItem, useSidebar } from "@/components/ui/sidebar"
import { Skeleton } from "@/components/ui/skeleton"
import { ICONS } from "@/constants/icons"
import { AUTH_TEXTS } from "@/constants/texts/auth.texts"
import { signOutUser } from "@/lib/firebase/auth/auth"
import { UserModel } from "@/types/users/user.model"
import { HugeiconsIcon } from "@hugeicons/react"

/** Botão no sidebar que mostra o nome do usuário e opções de rotas para gerenciar a conta. */
export default function NavUser() {
  const { isMobile } = useSidebar()
  const { user, userData, loading } = useAuth() // informação do usuário

  // Skeleton durante carregamento
  if (loading || !user || !userData) {
    return <NavUserSkeleton />
  }

  return (
    <SidebarMenu>
      <SidebarMenuItem>
        <DropdownMenu>
          <DropdownMenuTrigger asChild>
            {/* Botão */}
            <SidebarMenuButton tooltip={`${userData.firstName} ${userData.lastName} (${user?.email})`} size="lg" className="data-[state=open]:bg-sidebar-accent data-[state=open]:text-sidebar-accent-foreground">
              {/* Avatar, nome e e-mail */}
              <UserTile userData={userData!} />

              {/* Seta */}
              <HugeiconsIcon icon={isMobile ? ICONS.arrows.up : ICONS.arrows.right} className="ml-auto size-4" />
            </SidebarMenuButton>
          </DropdownMenuTrigger>

          {/* Opções ao clicar no botão de usuário */}
          <DropdownMenuContent className="w-(--radix-dropdown-menu-trigger-width) min-w-56 rounded-lg" side={isMobile ? "top" : "right"} align="end" sideOffset={4}>
            <DropdownMenuLabel className="p-0 font-normal">
              <div className="flex items-center gap-2 px-1 py-1.5 text-left text-sm">
                <UserTile userData={userData!} />
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
              <HugeiconsIcon icon={ICONS.auth.logout} /> {/* Ícone */}
              {AUTH_TEXTS.signOut} {/* Texto */}
            </DropdownMenuItem>
          </DropdownMenuContent>
        </DropdownMenu>
      </SidebarMenuItem>
    </SidebarMenu>
  )
}

/** Skeleton do `NavUser`. */
function NavUserSkeleton() {
  return (
    <SidebarMenu>
      <SidebarMenuItem>
        <SidebarMenuButton size="lg" disabled>
          {/* Avatar skeleton */}
          <Skeleton className="size-8 rounded-lg" />

          {/* Text skeleton */}
          <div className="grid flex-1 gap-1">
            <Skeleton className="h-4 w-24" />
            <Skeleton className="h-3 w-32" />
          </div>

          {/* Icon skeleton */}
          <Skeleton className="ml-auto size-4" />
        </SidebarMenuButton>
      </SidebarMenuItem>
    </SidebarMenu>
  )
}

/** Tile com avatar, nome do usuário e e-mail. */
function UserTile({ userData }: { userData: UserModel }) {
  return (
    <>
      <Avatar>
        {/* TODO: Imagem de avatar */}
        <AvatarImage src={""} alt={""} />
        {/* Iniciais */}
        <AvatarFallback className="bg-accent-foreground text-accent">{`${userData.firstName.charAt(0)}${userData.lastName.charAt(0)}`}</AvatarFallback>
      </Avatar>

      {/* Info */}
      <div className="grid flex-1 text-left text-sm leading-tight text-foreground">
        {/* TODO: Nome do usuário */}
        <span className="truncate font-medium">{`${userData.firstName} ${userData.lastName}`}</span>
        {/* TODO: E-mail do usuário */}
        <span className="truncate text-xs">{userData?.email}</span>
      </div>
    </>
  )
}
