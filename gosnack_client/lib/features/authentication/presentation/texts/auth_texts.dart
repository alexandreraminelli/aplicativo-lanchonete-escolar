/// Constantes de textos usados no contexto de autenticação.
abstract final class AuthTexts {
  // -- Login Screen -------------------------------------------------------- //
  static const String loginPageTitle = 'Bem-vindo ao Gosnack!';
  static const String loginPageSubtitle =
      'Entre com uma conta de estudante ou professor para fazer pedidos, acompanhar o cardápio e aproveitar suas vantagens na lanchonete.';

  // -- Signup Screen ------------------------------------------------------- //
  static const String signupPageTitle = 'Crie sua conta no Gosnack';
  static const String signupPageSubtitle =
      'Crie sua conta de estudante ou professor para fazer pedidos, acompanhar o cardápio e aproveitar todas as vantagens da lanchonete.';

  // -- Fields -------------------------------------------------------------- //
  static const String email = 'E-mail acadêmico';
  static const String password = 'Senha';

  static const String firstName = 'Primeiro nome';
  static const String lastName = 'Sobrenome';

  // -- Actions ------------------------------------------------------------- //
  static const String login = 'Entrar';
  static const String createAccount = 'Criar uma conta';
  static const String guestLogin = 'Entrar como convidado';

  static const String forgotPassword = 'Esqueci minha senha';

  // -- Verify Email Screens ------------------------------------------------ //

  static const String verifyEmailTitle = 'Verifique seu e-mail';
  static String verifyEmailSubtitle(String email) =>
      'Enviamos um link de confirmação para o e-mail $email. Acesse sua caixa de entrada e clique no link para ativar sua conta.';

  static const String resendVerificationEmail =
      'Reenviar e-mail de verificação';
  static const String emailAlreadyVerified = 'Já verifiquei meu e-mail';

  static const String verifiedEmailTitle = 'E-mail verificado com sucesso';
  static const String verifiedEmailSubtitle =
      'Sua conta foi ativada. Agora você pode acessar o GoSnack e realizar seus pedidos. Aproveite!';
}
