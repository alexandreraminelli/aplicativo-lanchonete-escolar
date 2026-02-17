import 'package:gosnack_client/features/authentication/domain/repositories/authentication_repository.dart';

/// UseCase para reenviar o e-mail de verificação.
class ResendVerifyEmailUseCase {
  // -- Private Instance Variables ------------------------------------------ //

  final AuthenticationRepository _repository;

  // -- Public Constructor -------------------------------------------------- //

  ResendVerifyEmailUseCase(this._repository);

  // -- Public Methods ------------------------------------------------------ //

  /// Reenvia o e-mail de verificação para o usuário.
  Future<void> call() async {
    await _repository.resendVerificationEmail();
  }
}
