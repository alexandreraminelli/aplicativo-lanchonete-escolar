import { PAGE_METADATA } from "@/src/constants/metadata"
import { Metadata } from "next"

/** Metadados da página de unidades. */
export const metadata: Metadata = {
  title: PAGE_METADATA.units.title,
}

/**
 * Página de gerenciar unidades.
 */
export default function UnitsPage() {
  return <h1>Gerenciar Unidades</h1>
}
