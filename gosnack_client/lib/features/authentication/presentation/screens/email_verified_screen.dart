import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:gosnack_client/core/constants/enums.dart';
import 'package:gosnack_client/core/constants/styles/spacing.dart';
import 'package:gosnack_client/core/resources/images/animations_paths.dart';
import 'package:gosnack_client/core/resources/strings/nav_texts.dart';
import 'package:gosnack_client/core/widgets/appbar/main_appbar.dart';
import 'package:gosnack_client/core/widgets/feedback/action/feedback_action_screen.dart';
import 'package:gosnack_client/features/authentication/presentation/controllers/verify_email_controller.dart';
import 'package:gosnack_client/features/authentication/presentation/texts/auth_texts.dart';

/// Tela de confirmação de e-mail verificado.
class EmailVerifiedScreen extends GetView<VerifyEmailController> {
  // -- Public Constructor -------------------------------------------------- //

  const EmailVerifiedScreen({super.key});

  // -- Build Method --------------------------------------------------------- //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // -- Appbar
      appBar: const MainAppbar(),

      // -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: KSpacing.horizontalScreenPadding,
          child: FeedbackActionScreen(
            title: AuthTexts.verifiedEmailTitle,
            subtitle: AuthTexts.verifiedEmailSubtitle,

            imageType: ImageType.animation,
            imagePath: KAnimations.check,

            body: [
              ElevatedButton(
                onPressed: controller.continueToHome,
                child: const Text(NavTexts.goToHome),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
