import 'package:get/get.dart';
import 'package:gosnack_client/features/authentication/domain/use_cases/login_usecase.dart';
import 'package:gosnack_client/features/authentication/presentation/controllers/login_controller.dart';

/// Bindings para a funcionalidade de login.
class LoginBindings extends Bindings {
  @override
  void dependencies() {
    // -- Use Cases
    Get.lazyPut(() => LoginUseCase(Get.find()));

    // -- Controllers
    Get.lazyPut(() => LoginController(Get.find(), Get.find()));
  }
}
