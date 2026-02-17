import 'package:get/instance_manager.dart';
import 'package:gosnack_client/features/authentication/domain/use_cases/resend_verify_email_usecase.dart';
import 'package:gosnack_client/features/authentication/presentation/controllers/verify_email_controller.dart';

/// Bindings para a tela de verificação de e-mail.
class VerifyEmailBindings extends Bindings {
  @override
  void dependencies() {
    // -- Use Cases
    Get.lazyPut(() => ResendVerifyEmailUseCase(Get.find()));

    // -- Controllers
    Get.lazyPut(() => VerifyEmailController(Get.find(), Get.find()));
  }
}
