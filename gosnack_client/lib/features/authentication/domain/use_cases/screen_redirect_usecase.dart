import 'package:gosnack_client/features/authentication/domain/interfaces/authentication_repository.dart';
import 'package:gosnack_client/features/onboarding/domain/interfaces/onboarding_repository.dart';
import 'package:gosnack_client/core/routing/routes.dart';

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
    if (_onBoardingRepository.isFirstTime()) {
      return KRoutes.onBoarding; // Tela de boas-vindas (Onboarding)
    } else {
      // Obter usuário
      final user = await _authRepository.getCurrentUser();

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
