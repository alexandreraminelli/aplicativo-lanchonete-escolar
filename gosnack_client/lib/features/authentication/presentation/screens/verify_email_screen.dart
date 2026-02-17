import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:gosnack_client/core/constants/enums.dart';
import 'package:gosnack_client/core/constants/styles/spacing.dart';
import 'package:gosnack_client/core/resources/images/animations_paths.dart';
import 'package:gosnack_client/core/widgets/appbar/main_appbar.dart';
import 'package:gosnack_client/core/widgets/feedback/action/feedback_action_screen.dart';
import 'package:gosnack_client/features/authentication/presentation/controllers/verify_email_controller.dart';
import 'package:gosnack_client/features/authentication/presentation/texts/auth_texts.dart';

/// Tela para verificação de e-mail.
class VerifyEmailScreen extends GetView<VerifyEmailController> {
  // -- Public Constructor -------------------------------------------------- //

  const VerifyEmailScreen({super.key});

  // -- Build Method --------------------------------------------------------- //
  @override
  Widget build(BuildContext context) {
    // -- Botão de continuar
    final continueButton = SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: controller.checkEmailVerified,
        child: const Text(AuthTexts.emailAlreadyVerified),
      ),
    );

    // -- Botão de reenviar e-mail
    final resendButton = SizedBox(
      width: double.infinity,
      child: Obx(
        () => FilledButton(
          onPressed: controller.isLoading.value
              ? null
              : controller.resendVerificationEmail,
          child: controller.isLoading.value
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text(AuthTexts.resendVerificationEmail),
        ),
      ),
    );

    // -- Main Widget
    return Scaffold(
      // -- AppBar
      appBar: const MainAppbar(),

      // -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: KSpacing.horizontalScreenPadding,
          child: FeedbackActionScreen(
            title: AuthTexts.verifyEmailTitle,
            subtitle: AuthTexts.verifyEmailSubtitle('[email]'),

            imageType: ImageType.animation,
            imagePath: KAnimations.verifyEmail,

            // -- Botões de ação
            body: [continueButton, resendButton],
          ),
        ),
      ),
    );
  }
}
