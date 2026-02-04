/// Entidade que representa um usuário autenticado no app.
class UserEntity {
  // -- Public Instance Variables ------------------------------------------- //

  // -- User Data

  /// ID do usuário no Firebase Authentication.
  final String id;

  /// E-mail do usuário.
  final String email;

  /// Primeiro nome do usuário.
  final String firstName;

  /// Sobrenome do usuário.
  final String lastName;

  // -- User Status

  /// Se o e-mail do usuário foi verificado.
  final bool isEmailVerified;

  // -- Public Constructor -------------------------------------------------- //

  const UserEntity({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.isEmailVerified,
  });
}
