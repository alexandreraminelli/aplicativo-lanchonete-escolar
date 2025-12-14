/**
 * Layout das páginas privadas.
 * Acessíveis apenas após a autenticação.
 */
export default function PrivateLayout({ children }: { children: React.ReactNode }) {
  // TODO: redirecionar funcionários não autenticados para a página de login

  return <>{children}</>
}
