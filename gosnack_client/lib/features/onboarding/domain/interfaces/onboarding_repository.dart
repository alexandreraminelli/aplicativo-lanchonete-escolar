/// Interface com o contrato do repositório de onboarding.
///
/// Define os métodos que devem ser implementados para .
abstract class OnBoardingRepository {
  /// Verifica se o usuário já passou pela tela de onboarding (boas-vindas).
  bool isFirstTime();

  /// Marca que o usuário já passou pela tela de onboarding (boas-vindas).
  Future<void> setFirstTimeFalse();
}
