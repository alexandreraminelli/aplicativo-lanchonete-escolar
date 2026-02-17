import 'package:firebase_auth/firebase_auth.dart';
import 'package:gosnack_client/features/authentication/domain/repositories/authentication_repository.dart';

/// UseCase para obter o usuário autenticado atualmente.
class GetCurrentUserUseCase {
  // -- Private Instance Variables ------------------------------------------ //

  final AuthenticationRepository _repository;

  // -- Public Constructor -------------------------------------------------- //

  GetCurrentUserUseCase(this._repository);

  // -- Public Methods ------------------------------------------------------ //

  /// Obtém o usuário autenticado atualmente.
  /// Retorna `null` se não houver.
  Future<User?> call() async {
    return await _repository.getCurrentUser();
  }
}
