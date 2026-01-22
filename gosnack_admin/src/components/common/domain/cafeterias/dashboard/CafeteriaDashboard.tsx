/**
 * Props de `CafeteriaDashboard`.
 */
interface Props {
  /** ID da unidade. */
  unitId: string
  /** ID da lanchonete. */
  cafeteriaId: string
}

/**
 * Dashboard de uma lanchonete especifica.
 *
 * Usado como:
 * - Página de detalhes de lanchonete para **admin**
 * - Página inicial de "manager"
 */
export default function CafeteriaDashboard({ unitId, cafeteriaId }: Props) {
  return (
    <p>
      Dashboard de Lanchonete: {unitId}/{cafeteriaId}
    </p>
  )
}
