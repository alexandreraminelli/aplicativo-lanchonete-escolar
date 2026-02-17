import 'package:get/get.dart';
import 'package:gosnack_client/core/logging/logger.dart';
import 'package:gosnack_client/core/resources/icons/icons.dart';
import 'package:gosnack_client/core/routing/routes.dart';
import 'package:gosnack_client/core/widgets/feedback/popups/snackbars.dart';
import 'package:gosnack_client/features/authentication/domain/use_cases/resend_verify_email_usecase.dart';
import 'package:gosnack_client/features/authentication/presentation/controllers/auth_controller.dart';
import 'package:gosnack_client/features/authentication/presentation/texts/auth_error_texts.dart';
import 'package:gosnack_client/features/authentication/presentation/texts/auth_success_texts.dart';

/// Controlador para a tela de verificação de e-mail.
class VerifyEmailController extends GetxController {
  // -- Use Case Variables -------------------------------------------------- //

  final ResendVerifyEmailUseCase _resendVerifyEmailUseCase;

  // -- Others Controllers -------------------------------------------------- //

  final AuthController _authController;

  // -- State Variables ----------------------------------------------------- //

  final email = RxnString();
  final isLoading = false.obs;

  // -- Public Constructor -------------------------------------------------- //

  VerifyEmailController(this._resendVerifyEmailUseCase, this._authController);

  // -- Lifecycle Methods --------------------------------------------------- //

  @override
  void onReady() {
    super.onReady();
    _loadUserEmail();
  }

  // -- Private Methods ----------------------------------------------------- //

  /// Obtém o e-mail do usuário autenticado e armazena na variável reativa.
  Future<void> _loadUserEmail() async {
    try {
      final user = await _authController.getCurrentUser();
      email.value = user?.email;
    } catch (e) {
      LoggerHelp.error('Erro ao obter e-mail do usuário: $e');
    }
  }

  /// Verifica se o e-mail do usuário foi verificado.
  Future<bool> _isEmailVerified() async {
    try {
      // Recarregar usuário para obter status atualizado
      await _authController.reloadCurrentUser();

      final user = await _authController.getCurrentUser();
      if (user == null) return false;
      return user.emailVerified;
    } catch (e) {
      LoggerHelp.error('Erro ao verificar status de verificação do e-mail: $e');
      return false;
    }
  }

  // -- Public Methods ------------------------------------------------------ //

  /// Reenvia o e-mail de verificação para o usuário.
  Future<void> resendVerificationEmail() async {
    try {
      isLoading.value = true;
      await _resendVerifyEmailUseCase();

      // Sucesso
      AppSnackBars.showSuccessSnackBar(
        title: AuthSuccessTexts.resendEmailSuccessTitle,
        message: AuthSuccessTexts.resendEmailSuccessMessage(email.value ?? ''),
      );
    } catch (e) {
      LoggerHelp.error('Erro ao reenviar e-mail de verificação: $e');
      AppSnackBars.showErrorSnackBar(
        title: AuthErrorTexts.resendEmailErrorTitle,
        message: AuthErrorTexts.resendEmailErrorMessage(email.value ?? ''),
      );
    } finally {
      isLoading.value = false;
    }
  }

  /// Redireciona o usuário para a tela de e-mail verificado, caso o e-mail já tenha sido verificado.
  Future<void> checkEmailVerified() async {
    if (await _isEmailVerified()) {
      Get.offNamed(KRoutes.emailVerified);
    } else {
      AppSnackBars.showSnackBar(
        title: AuthErrorTexts.emailNotVerifiedTitle,
        message: AuthErrorTexts.emailNotVerifiedMessage,
        icon: KIcons.email,
      );
    }
  }

  /// Redireciona o usuário para a tela inicial.
  Future<void> continueToHome() async {
    await _authController.screenRedirect();
  }
}
