import 'package:flutter/material.dart';
import 'package:gosnack_client/utils/constants/content/text_strings.dart';
import 'package:gosnack_client/utils/constants/styles/sizes.dart';
import 'package:hugeicons/hugeicons.dart';

/// Botões de próxima página e continuar na OnBoarding Screen.
class OnBoardingButtons extends StatelessWidget {
  // -- Public Constructor -------------------------------------------------- //
  const OnBoardingButtons({super.key});

  // -- Build Method -------------------------------------------------------- //
  @override
  Widget build(BuildContext context) {
    // -- Widgets internos

    /// Botão de avançar para a próxima página.
    final nextButton = Row(
      mainAxisAlignment: MainAxisAlignment.end, // no final da página
      children: [
        ElevatedButton(
          onPressed: () {
            // TODO: avançar para a próxima página
          },
          // formato quadrado
          style: ElevatedButton.styleFrom(
            minimumSize: KSizes.squareButtonLg,
            padding: EdgeInsets.zero,
          ),
          child: const HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01),
        ),
      ],
    );

    /// Botão de continuar para a tela de login.
    final continueButton = SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // TODO: ir para a tela de login
        },
        child: const Text(KTexts.continueT),
      ),
    );

    // -- Widget principal
    return nextButton;
  }
}
