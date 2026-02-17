/// Textos de erro na autenticação.
abstract final class AuthErrorTexts {
  // -- Signup Errors ------------------------------------------------------- //
  static const String signUpErrorTitle = 'Erro ao Criar Conta';

  // -- Login Errors -------------------------------------------------------- //
  static const String loginErrorTitle = 'Erro ao Realizar Login';

  // -- Resend Email Errors ------------------------------------------------- //
  static const String resendEmailErrorTitle = 'Erro ao Reenviar E-mail';
  static String resendEmailErrorMessage(String email) =>
      'Não foi possível reenviar o e-mail de verificação para $email. Tente novamente mais tarde.';
}
