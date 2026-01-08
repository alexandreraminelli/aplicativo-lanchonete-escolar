import { PAGE_METADATA } from "@/constants/metadata"
import { Metadata } from "next"

/** Metadados da página de dashboard. */
export const metadata: Metadata = {
  title: PAGE_METADATA.dashboard.title,
}

/**
 * Página de dashboard.
 * Serve como a página inicial do app após a autenticação do usuário.
 */
export default function DashboardPage() {
  return <h1>Dashboard Page</h1>
}
