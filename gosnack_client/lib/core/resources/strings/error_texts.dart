/// Textos de erro padrão para a aplicação.
abstract final class ErrorTexts {
  static const String genericErrorMessage =
      'Ocorreu um erro inesperado. Tente novamente mais tarde.';

  // -- Network Errors ------------------------------------------------------ //

  // -- Sem Internet
  static const String noInternetTitle = 'Sem conexão com a internet';
  static const String noInternetSubtitle =
      'Verifique se o Wi-Fi ou dados móveis estão ativados';
}
