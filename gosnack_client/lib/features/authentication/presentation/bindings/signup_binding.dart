import 'package:get/get.dart';
import 'package:gosnack_client/features/authentication/domain/use_cases/signup_usecase.dart';
import 'package:gosnack_client/features/authentication/presentation/controllers/signup_controller.dart';

/// Bindings para a tela de criar conta.
class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    // -- Use Cases
    Get.lazyPut<SignUpUseCase>(() => SignUpUseCase(Get.find()));

    // -- Controllers
    Get.lazyPut<SignUpController>(
      () => SignUpController(Get.find(), Get.find()),
    );
  }
}
