/// Textos de sucesso na autenticação.
abstract final class AuthSuccessTexts {
  // -- Sign-up Success ----------------------------------------------------- //
  static const String signupSuccessTitle = 'Conta criada com sucesso';
  static const String signupSuccessMessage =
      'Verifique o e-mail de confirmação enviado.';

  // -- Sign-in Success ----------------------------------------------------- //
  static const String loginSuccessTitle = 'Login realizado com sucesso';
  static const loginSuccessMessage = 'Bem-vindo de volta!';

  // -- Resend Email Success ------------------------------------------------ //
  static const String resendEmailSuccessTitle = 'E-mail reenviado';
  static String resendEmailSuccessMessage(String email) =>
      'E-mail de verificação reenviado para $email. Verifique sua caixa de entrada e a pasta de spam.';
}
