import 'package:flutter/material.dart';
import 'package:gosnack_client/core/constants/enums.dart';
import 'package:gosnack_client/core/constants/styles/sizes.dart';
import 'package:gosnack_client/core/constants/styles/spacing.dart';
import 'package:gosnack_client/core/resources/images/animations_paths.dart';
import 'package:gosnack_client/core/widgets/appbar/main_appbar.dart';
import 'package:gosnack_client/core/widgets/feedback/action/feedback_action_screen.dart';
import 'package:gosnack_client/features/authentication/presentation/texts/auth_texts.dart';

/// Tela para verificação de e-mail.
class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // -- Botão de continuar
    final continueButton = SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        child: const Text(AuthTexts.emailAlreadyVerified),
        onPressed: () => (), // TODO: Verificar e-mail
      ),
    );

    // -- Botão de reenviar e-mail
    final resendButton = SizedBox(
      width: double.infinity,
      child: FilledButton(
        child: const Text(AuthTexts.resendVerificationEmail),
        onPressed: () => (), // TODO: Reenviar e-mail de verificação
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
            body: Column(
              spacing: KSizes.spacingBtwItems,
              children: [continueButton, resendButton],
            ),
          ),
        ),
      ),
    );
  }
}
