import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gosnack_client/features/onboarding/data/datasources/onboarding_local_datasource.dart';
import 'package:gosnack_client/features/onboarding/data/repositories/onboarding_repository_impl.dart';
import 'package:gosnack_client/features/onboarding/domain/interfaces/onboarding_repository.dart';
import 'package:gosnack_client/features/onboarding/domain/use_cases/complete_onboarding_usecase.dart';
import 'package:gosnack_client/features/onboarding/presentation/controllers/onboarding_controller.dart';

/// Bindings para a tela de OnBoarding.
class OnBoardingBinding extends Bindings {
  @override
  void dependencies() {
    // -- DataSources
    Get.lazyPut(() => OnBoardingLocalDatasource(GetStorage()));

    // -- Repositories
    Get.lazyPut<OnBoardingRepository>(
      () => OnBoardingRepositoryImpl(Get.find()),
    );

    // -- Use Cases
    Get.lazyPut(() => CompleteOnboardingUseCase(Get.find()));

    // -- Controllers
    Get.lazyPut(() => OnBoardingController(Get.find()));
  }
}
