import 'package:gosnack_client/features/authentication/domain/repositories/authentication_repository.dart';

/// UseCase para verificar o status de autenticação do usuário.
class CheckAuthenticationStatusUsecase {
  // -- Private Instance Variables ------------------------------------------ //

  /// Repositório de autenticação.
  final AuthenticationRepository _repository;

  // -- Public Constructor -------------------------------------------------- //

  CheckAuthenticationStatusUsecase(this._repository);

  // -- Public Methods ------------------------------------------------------ //

  /// Verifica se o usuário está autenticado.
  bool call() {
    return _repository.isAuthenticated();
  }
}
