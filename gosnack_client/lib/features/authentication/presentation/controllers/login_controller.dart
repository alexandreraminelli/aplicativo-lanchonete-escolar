import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gosnack_client/core/errors/firebase_exception.dart';
import 'package:gosnack_client/core/errors/no_internet_exception.dart';
import 'package:gosnack_client/core/logging/logger.dart';
import 'package:gosnack_client/core/utils/device_utility.dart';
import 'package:gosnack_client/core/widgets/feedback/messages/common_snackbars.dart';
import 'package:gosnack_client/core/widgets/feedback/popups/snackbars.dart';
import 'package:gosnack_client/features/authentication/domain/use_cases/login_usecase.dart';
import 'package:gosnack_client/features/authentication/presentation/controllers/auth_controller.dart';
import 'package:gosnack_client/features/authentication/presentation/texts/auth_error_texts.dart';
import 'package:gosnack_client/features/authentication/presentation/texts/auth_success_texts.dart';

/// Controlador da tela de login.
class LoginController extends GetxController {
  // -- Use Cases Variables ------------------------------------------------- //

  final LoginUseCase _loginUseCase;

  // -- Others Controllers -------------------------------------------------- //

  final AuthController _authController;

  // -- Public Constructor -------------------------------------------------- //

  LoginController(this._loginUseCase, this._authController);

  // -- Form Controllers ---------------------------------------------------- //

  /// Chave do formulário de login.
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  // Campos do form
  final email = TextEditingController();
  final password = TextEditingController();

  // -- State Variables ----------------------------------------------------- //

  /// Se o login está em andamento.
  final isSubmitting = false.obs;

  // -- Public Methods ------------------------------------------------------ //

  /// Realizar o login do usuário.
  Future<void> login() async {
    DeviceUtils.hideKeyboard(); // recolher teclado
    try {
      // Evitar múltiplos envios
      if (isSubmitting.value) return;
      isSubmitting.value = true;

      // Validar formulário
      if (!loginFormKey.currentState!.validate()) {
        return;
      }

      // Executar UseCase
      final user = await _loginUseCase(
        email: email.text.trim(),
        password: password.text.trim(),
      );

      // Em caso de sucesso:
      LoggerHelp.info('Usuário logado com sucesso: ${user.id}');
      AppSnackBars.showSuccessSnackBar(
        title: AuthSuccessTexts.loginSuccessTitle,
        message: AuthSuccessTexts.loginSuccessMessage,
      );
      await _authController.screenRedirect(); // redirecionar usuário
    } on NoInternetException {
      CommonSnackBars.showNoInternetSnackBar(); // Sem Internet
    } catch (e) {
      AppSnackBars.showErrorSnackBar(
        title: AuthErrorTexts.loginErrorTitle,
        message: AppFirebaseException.getErrorMessage(e),
      );
    } finally {
      isSubmitting.value = false; // Resetar estado de envio
    }
  }
}
