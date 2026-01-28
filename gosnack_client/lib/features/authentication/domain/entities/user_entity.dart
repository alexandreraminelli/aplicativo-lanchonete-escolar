/// Entidade que representa um usuário autenticado no app.
class UserEntity {
  // -- Public Instance Variables ------------------------------------------- //

  /// ID do usuário no Firebase Authentication.
  final String id;

  /// E-mail do usuário.
  final String email;

  /// Se o e-mail do usuário foi verificado.
  final bool isEmailVerified;

  // -- Public Constructor -------------------------------------------------- //

  const UserEntity({
    required this.id,
    required this.email,
    required this.isEmailVerified,
  });
}
