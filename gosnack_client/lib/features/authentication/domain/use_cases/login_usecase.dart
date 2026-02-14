import 'package:gosnack_client/features/authentication/domain/entities/user_entity.dart';
import 'package:gosnack_client/features/authentication/domain/repositories/authentication_repository.dart';

/// UseCase para efetuar login do usuário.
class LoginUseCase {
  // -- Private Instance Variables ------------------------------------------ //

  /// Repositório de autenticação.
  final AuthenticationRepository _repository;

  // -- Public Constructor -------------------------------------------------- //

  LoginUseCase(this._repository);

  // -- Public Methods ------------------------------------------------------ //

  /// Efetua login com e-mail e senha.
  Future<UserEntity> call({
    required String email,
    required String password,
  }) async {
    return await _repository.loginWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
