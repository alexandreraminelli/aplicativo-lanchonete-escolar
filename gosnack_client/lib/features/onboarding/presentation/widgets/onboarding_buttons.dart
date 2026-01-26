import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:gosnack_client/features/onboarding/presentation/controllers/onboarding_controller.dart';
import 'package:gosnack_client/utils/constants/content/icons.dart';
import 'package:gosnack_client/utils/constants/content/text_strings.dart';
import 'package:gosnack_client/utils/constants/styles/sizes.dart';
import 'package:hugeicons/hugeicons.dart';

/// Botões de próxima página e continuar na OnBoarding Screen.
/// Exibe o botão de próxima página ou o botão de continuar na última.
class OnBoardingButtons extends StatelessWidget {
  // -- Public Constructor -------------------------------------------------- //
  const OnBoardingButtons({super.key});

  // -- Build Method -------------------------------------------------------- //
  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;

    // -- Widgets internos

    /// Botão de avançar para a próxima página.
    final nextButton = Row(
      mainAxisAlignment: MainAxisAlignment.end, // no final da página
      children: [
        ElevatedButton(
          // avançar para a próxima
          onPressed: () => controller.nextPage(),
          // formato quadrado
          style: ElevatedButton.styleFrom(
            minimumSize: KSizes.squareButtonLg,
            padding: EdgeInsets.zero,
          ),
          child: const HugeIcon(icon: KIcons.arrowRight),
        ),
      ],
    );

    /// Botão de continuar para a tela de login.
    final continueButton = SizedBox(
      width: double.infinity, // width full
      child: ElevatedButton(
        // TODO: ir para a tela de login (quando for estiver preenchido)
        onPressed: null,
        child: const Text(KTexts.continueT),
      ),
    );

    // -- Widget principal
    return Obx(() => controller.isLastPage ? continueButton : nextButton);
  }
}
