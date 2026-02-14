import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:gosnack_client/features/authentication/domain/use_cases/signup_usecase.dart';
import 'package:gosnack_client/features/authentication/presentation/controllers/auth_controller.dart';
import 'package:gosnack_client/features/authentication/presentation/texts/auth_error_texts.dart';
import 'package:gosnack_client/features/authentication/presentation/texts/auth_success_texts.dart';
import 'package:gosnack_client/core/errors/firebase_exception.dart';
import 'package:gosnack_client/core/errors/no_internet_exception.dart';
import 'package:gosnack_client/core/logging/logger.dart';
import 'package:gosnack_client/core/widgets/feedback/messages/common_snackbars.dart';
import 'package:gosnack_client/core/widgets/feedback/snackbars.dart';

/// Controlador do formulário de criar conta.
class SignUpController extends GetxController {
  // -- Use Cases Variables ------------------------------------------------- //

  final SignUpUseCase _signUpUseCase;

  // -- Others Controllers -------------------------------------------------- //

  final AuthController _authController;

  // -- Public Constructor -------------------------------------------------- //

  SignUpController(this._signUpUseCase, this._authController);

  // -- Form Controllers ---------------------------------------------------- //

  /// Chave do formulário.
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // Campos do form
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  // -- Public Methods ------------------------------------------------------ //

  /// Realizar o cadastro do usuário.
  Future<void> signUp() async {
    try {
      // Validar formulário
      if (!signupFormKey.currentState!.validate()) {
        return;
      }

      // Executar UseCase
      final user = await _signUpUseCase(
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        email: email.text.trim(),
        password: password.text.trim(),
      );

      // Em caso de sucesso:
      LoggerHelp.info('Usuário cadastrado com sucesso: ${user?.id}');
      AppSnackBars.showSuccessSnackBar(
        title: AuthSuccessTexts.signupSuccessTitle,
        message: AuthSuccessTexts.signupSuccessMessage,
      );
      await _authController.screenRedirect(); // redirecionar usuário
    } on NoInternetException {
      CommonSnackBars.showNoInternetSnackBar(); // Sem Internet
    } catch (e) {
      AppSnackBars.showErrorSnackBar(
        title: AuthErrorTexts.signUpErrorTitle,
        message: AppFirebaseException.getErrorMessage(e),
      );
    }
  }
}
