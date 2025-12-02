import 'package:flutter/material.dart';
import 'package:gosnack_client/utils/constants/styles/colors.dart';
import 'package:gosnack_client/utils/constants/styles/sizes.dart';
import 'package:hugeicons/hugeicons.dart';

/// **Tela de OnBoarding (Boas-Vindas)**.
///
/// Exibida quando o usuário abre o aplicativo pela primeira vez.
/// Fornece uma rápida visão geral dos principais recursos e funcionalidades do aplicativo.
class OnBoardingScreen extends StatelessWidget {
  // -- Public Constructor -------------------------------------------------- //
  const OnBoardingScreen({super.key});

  // -- Build Method -------------------------------------------------------- //
  @override
  Widget build(BuildContext context) {
    // -- Widgets internos

    /// Botão de avançar para a próxima página.
    final nextButton = Row(
      children: [
        const Spacer(),
        ElevatedButton(
          onPressed: () {
            // TODO: avançar para a próxima página
          },
          style: ElevatedButton.styleFrom(
            minimumSize: KSizes.squareButtonLg,
            padding: EdgeInsets.zero,
          ),
          child: const HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01),
        ),
      ],
    );

    /// Botão de continuar para a tela de login.
    final continueButton = ElevatedButton(
      onPressed: () {
        // TODO: ir para a tela de login
      },
      child: const Text("Continuar"),
    );

    // -- Scaffold
    return Scaffold(
      // -- AppBar

      // -- Body
      body: Center(
        child: Text(
          "OnBoarding Screen",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      // -- Indicador e Botão
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: KSizes.horizontalScreenPadding,
          vertical: KSizes.xl2,
        ),
        child: nextButton,
      ),
    );
  }
}
