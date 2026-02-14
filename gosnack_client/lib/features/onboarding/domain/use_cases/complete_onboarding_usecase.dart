import 'package:gosnack_client/features/onboarding/domain/repositories/onboarding_repository.dart';

/// UseCase para completar o processo de onboarding.
class CompleteOnboardingUseCase {
  // -- Private Instance Variables ------------------------------------------ //

  /// Repositório de onboarding.
  final OnBoardingRepository _repository;

  // -- Public Constructor -------------------------------------------------- //

  CompleteOnboardingUseCase(this._repository);

  // -- Public Methods ------------------------------------------------------ //

  /// Marca que o usuário completou o onboarding.
  Future<void> call() async {
    await _repository.setFirstTimeFalse();
  }
}
