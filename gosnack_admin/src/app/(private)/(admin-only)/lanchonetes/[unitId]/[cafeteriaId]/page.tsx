import CafeteriaDashboard from "@/components/common/domain/cafeterias/dashboard/CafeteriaDashboard"
import { useCafeteria } from "@/hooks/queries/cafeterias/cafeteria.queries"

/**
 * Parâmetros da rota dinâmica `/lanchonetes/[id]`
 */
interface Params {
  params: Promise<{
    /** ID da unidade. */
    unitId: string
    /** ID da lanchonete. */
    cafeteriaId: string
  }>
}

/**
 * Página de informações da lanchonete.
 */
export default async function CafeteriaDetailsPage({ params }: Params) {
  const { unitId, cafeteriaId } = await params

  return <CafeteriaDashboard unitId={unitId} cafeteriaId={cafeteriaId} />
}
