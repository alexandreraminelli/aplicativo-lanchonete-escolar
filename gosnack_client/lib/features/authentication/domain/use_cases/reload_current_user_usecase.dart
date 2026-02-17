import 'package:gosnack_client/features/authentication/domain/repositories/authentication_repository.dart';

/// Use Case para recarregar os dados do usuário autenticado do Firebase Auth.
class ReloadCurrentUserUseCase {
  // -- Private Instance Variables ------------------------------------------ //

  final AuthenticationRepository _repository;

  // -- Public Constructor -------------------------------------------------- //

  ReloadCurrentUserUseCase(this._repository);

  // -- Public Methods ------------------------------------------------------ //

  /// Recarrega os dados do usuário autenticado do Firebase Auth.
  Future<void> call() async {
    await _repository.reloadCurrentUser();
  }
}
