import 'package:gosnack_client/core/routing/routes.dart';
import 'package:gosnack_client/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:gosnack_client/features/onboarding/domain/repositories/onboarding_repository.dart';

/// UseCase responsável por determinar para qual tela redirecionar o usuário
/// com base no seu estado de autenticação.
class ScreenRedirectUseCase {
  // -- Private Instance Variables ------------------------------------------ //

  /// Repositório de autenticação.
  final AuthenticationRepository _authRepository;

  /// Repositório de onboarding.
  final OnBoardingRepository _onBoardingRepository;

  // -- Public Constructor -------------------------------------------------- //

  ScreenRedirectUseCase(this._authRepository, this._onBoardingRepository);

  // -- Public Methods ------------------------------------------------------ //

  /// Redireciona para a tela relevante com base no estado de autenticação:
  /// - **Primeira vez no app:** tela de boas-vindas (Onboarding).
  /// - **Usuário não autenticado:** tela de login.
  /// - **Usuário autenticado**:
  ///   - **E-mail não verificado:** tela de verificação de e-mail.
  ///   - **E-mail verificado:** tela inicial do app.
  Future<String> call() async {
    // Obter usuário
    final user = await _authRepository.getCurrentUser();

    // Determinar redirecionamento
    if (user == null) {
      // Usuário não autenticado
      if (_onBoardingRepository.isFirstTime()) {
        // Primeira vez no app
        return KRoutes.onBoarding; // Tela de boas-vindas (Onboarding)
      } else {
        // Usuário não autenticado
        return KRoutes.signin; // Tela de login
      }
    } else {
      // Usuário autenticado
      if (user.emailVerified) {
        // E-mail verificado
        return KRoutes.home; // Tela inicial do app
      } else {
        return KRoutes.verifyEmail; // Tela de verificação de e-mail
      }
    }
  }
}
