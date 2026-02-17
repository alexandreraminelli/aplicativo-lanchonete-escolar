/// Textos de erro na autenticação.
abstract final class AuthErrorTexts {
  // -- Signup Errors ------------------------------------------------------- //
  static const String signUpErrorTitle = 'Erro ao Criar Conta';

  // -- Login Errors -------------------------------------------------------- //
  static const String loginErrorTitle = 'Erro ao Realizar Login';

  // -- Email Not Verified -------------------------------------------------- //
  static const String emailNotVerifiedTitle = 'E-mail Não Verificado';
  static const String emailNotVerifiedMessage =
      'Seu e-mail ainda não foi verificado. Por favor, verifique sua caixa de entrada e a pasta de spam para encontrar o e-mail de verificação.';

  // -- Resend Email Errors ------------------------------------------------- //
  static const String resendEmailErrorTitle = 'Erro ao Reenviar E-mail';
  static String resendEmailErrorMessage(String email) =>
      'Não foi possível reenviar o e-mail de verificação para $email. Tente novamente mais tarde.';
}
