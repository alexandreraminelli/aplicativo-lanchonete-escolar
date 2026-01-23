/**
 * Segmento de uma rota para construção de breadcrumb.
 */
export type BreadcrumbSegment = {
  /** Rótulo do segmento. */
  label: string | ((params: Record<string, string>) => Promise<string> | string)
  /**
   * Link do segmento. Se não for fornecido, o segmento será exibido como texto simples.
   */
  href?: string | ((params: Record<string, string>) => string)
}

/**
 * Configuração do breadcrumb.
 */
export type BreadcrumbConfig = {
  /** Pattern da rota para corresponder. */
  pattern: RegExp
  /** Segmentos do breadcrumb para a rota. */
  segments: BreadcrumbSegment[]
}
