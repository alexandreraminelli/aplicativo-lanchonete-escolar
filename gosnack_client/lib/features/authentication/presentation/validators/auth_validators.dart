import 'package:gosnack_client/features/authentication/presentation/texts/auth_validation_texts.dart';

/// Partes do nome para validação.
enum NamePart { firstName, lastName }

/// Validadores para formulários de autenticação.
abstract final class AuthValidators {
  // -- Regular Expressions ------------------------------------------------- //

  /// Regex para validar nomes (apenas letras e espaços).
  static final RegExp _nameRegExp = RegExp(r'^[A-Za-zÀ-ú\s]+$');

  /// Regex para validar e-mails.
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  /// Regex para validar apenas caracteres maiúsculos.
  static final RegExp _upperCaseRegExp = RegExp(r'[A-Z]');

  /// Regex para validar apenas caracteres minúsculos.
  static final RegExp _lowerCaseRegExp = RegExp(r'[a-z]');

  /// Regex para validar apenas números.
  static final RegExp _numberRegExp = RegExp(r'[0-9]');

  /// Regex para validar apenas caracteres especiais.
  static final RegExp _specialCharRegExp = RegExp(r'[^\w\s]');

  // -- Validation Methods -------------------------------------------------- //

  /// Validação de nome.
  ///
  /// O nome deve conter apenas letras e espaços.
  static String? validateName(NamePart part, String? value) {
    value = value?.trim();
    if (value == null || value.isEmpty) {
      return switch (part) {
        NamePart.firstName => AuthValidationTexts.firstNameRequired,
        NamePart.lastName => AuthValidationTexts.lastNameRequired,
      };
    }
    if (!_nameRegExp.hasMatch(value)) {
      return AuthValidationTexts.invalidName;
    }
    return null;
  }

  /// Validação de e-mail.
  static String? validateEmail(String? value) {
    value = value?.trim().toLowerCase();
    if (value == null || value.isEmpty) {
      return AuthValidationTexts.emailRequired;
    }
    if (!_emailRegExp.hasMatch(value)) {
      return AuthValidationTexts.invalidEmail;
    }
    return null;
  }

  /// Validação de senha.
  ///
  /// A senha deve ter:
  /// - Pelo menos 8 caracteres.
  /// - Pelo menos uma letra maiúscula.
  /// - Pelo menos uma letra minúscula.
  /// - Pelo menos um número.
  /// - Pelo menos um caractere especial.
  static String? validatePassword(String? value) {
    value = value?.trim();
    final List<String> errors = [];
    if (value == null || value.isEmpty) {
      errors.add(AuthValidationTexts.passwordRequired);
    }
    if (value!.length < 8) {
      errors.add(AuthValidationTexts.shortPassword); // comprimento
    }
    if (!_upperCaseRegExp.hasMatch(value)) {
      errors.add(AuthValidationTexts.upperCasePasswordRequired); // tem upper
    }
    if (!_lowerCaseRegExp.hasMatch(value)) {
      errors.add(AuthValidationTexts.lowerCasePasswordRequired); // tem lower
    }
    if (!_numberRegExp.hasMatch(value)) {
      errors.add(AuthValidationTexts.numberPasswordRequired); // tem número
    }
    if (!_specialCharRegExp.hasMatch(value)) {
      errors.add(
        AuthValidationTexts.specialCharPasswordRequired,
      ); // tem especial
    }

    // Retornar erros se houver
    if (errors.isEmpty) {
      return null;
    } else {
      return errors.join('\n');
    }
  }
}
