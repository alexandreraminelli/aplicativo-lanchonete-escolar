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
  Future<String> call() async {
    if (_repository.isFirstTime()) {
      return KRoutes.onBoarding; // Tela de boas-vindas (Onboarding)
    } else {
      // Obter usuário
      final user = await _repository.getCurrentUser();

      if (user == null) {
        return KRoutes.signin; // Tela de login
      } else {
        if (user.emailVerified) {
          return KRoutes.home; // Tela inicial do app
        } else {
          return KRoutes.verifyEmail; // Tela de verificação de e-mail
        }
      }
    }
  }
}
