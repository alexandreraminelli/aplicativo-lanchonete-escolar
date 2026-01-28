import 'package:gosnack_client/features/authentication/domain/interfaces/authentication_repository.dart';
import 'package:gosnack_client/routes/routes.dart';

/// UseCase responsável por determinar para qual tela redirecionar o usuário
/// com base no seu estado de autenticação.
class ScreenRedirectUseCase {
  // -- Private Instance Variables ------------------------------------------ //

  /// Repositório de autenticação.
  final AuthenticationRepository _repository;

  // -- Public Constructor -------------------------------------------------- //

  ScreenRedirectUseCase(this._repository);

  // -- Public Methods ------------------------------------------------------ //

  /// Redireciona para a tela relevante com base no estado de autenticação:
  /// - **Primeira vez no app:** tela de boas-vindas (Onboarding).
  /// - **Usuário não autenticado:** tela de login.
  /// - **Usuário autenticado**:
  ///   - **E-mail não verificado:** tela de verificação de e-mail.
  ///   - **E-mail verificado:** tela inicial do app.
  String call() {
    if (_repository.isFirstTime()) {
      return KRoutes.onBoarding; // Tela de boas-vindas
    } else if (!_repository.isAuthenticated()) {
      return KRoutes.signin; // Tela de login
    } else {
      // Obter usuário
      final user = _repository.getCurrentUser();

      // Verificar e-mail
      if (user != null && !user.isEmailVerified) {
        return KRoutes.verifyEmail; // Tela de verificação de e-mail
      } else {
        return KRoutes.home; // Tela inicial do app
      }
    }
  }
}
