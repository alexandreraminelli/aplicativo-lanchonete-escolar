/// Textos de validação para formulários de autenticação.
abstract final class AuthValidationTexts {
  // -- Name Validation ----------------------------------------------------- //
  static const String firstNameRequired = 'O primeiro nome é obrigatório.';
  static const String lastNameRequired = 'O sobrenome é obrigatório.';
  static const String invalidName =
      'O nome deve conter apenas letras e espaços.';

  // -- Email Validation ---------------------------------------------------- //
  static const String emailRequired = 'O e-mail é obrigatório.';
  static const String invalidEmail = 'Por favor, insira um e-mail válido.';

  // -- Password Validation ------------------------------------------------- //
  static const String passwordRequired = 'A senha é obrigatória.';
  static const String shortPassword =
      'A senha deve ter pelo menos 8 caracteres.';
  static const String lowerCasePasswordRequired =
      'A senha deve conter pelo menos uma letra minúscula.';
  static const String upperCasePasswordRequired =
      'A senha deve conter pelo menos uma letra maiúscula.';
  static const String numberPasswordRequired =
      'A senha deve conter pelo menos um número.';
  static const String specialCharPasswordRequired =
      'A senha deve conter pelo menos um caractere especial.';
}
