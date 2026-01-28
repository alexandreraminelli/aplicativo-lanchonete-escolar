import 'package:gosnack_client/features/authentication/domain/interfaces/authentication_repository.dart';

/// UseCase para efetuar logout do usuário.
class LogoutUseCase {
  // -- Private Instance Variables ------------------------------------------ //

  /// Repositório de autenticação.
  final AuthenticationRepository _repository;

  // -- Public Constructor -------------------------------------------------- //

  LogoutUseCase(this._repository);

  // -- Public Methods ------------------------------------------------------ //

  /// Efetua o logout do usuário atual.
  Future<void> call() async {
    await _repository.logout();
  }
}
