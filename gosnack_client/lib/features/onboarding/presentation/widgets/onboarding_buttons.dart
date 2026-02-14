import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:gosnack_client/features/onboarding/presentation/controllers/onboarding_controller.dart';
import 'package:gosnack_client/features/cafeteria_selection/presentation/controllers/unit_cafeteria_selection_controller.dart';
import 'package:gosnack_client/core/resources/icons/icons.dart';
import 'package:gosnack_client/core/resources/strings/main_texts.dart';
import 'package:gosnack_client/core/constants/styles/sizes.dart';
import 'package:hugeicons/hugeicons.dart';

/// Botões de próxima página e continuar na OnBoarding Screen.
/// Exibe o botão de próxima página ou o botão de continuar na última.
class OnBoardingButtons extends GetView<OnBoardingController> {
  // -- Public Constructor -------------------------------------------------- //
  const OnBoardingButtons({super.key});

  // -- Build Method -------------------------------------------------------- //
  @override
  Widget build(BuildContext context) {
    // -- Controlador
    final unitCafeteriaController =
        Get.find<UnitCafeteriaSelectionController>();

    /// -- Botão de avançar para a próxima página.
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

    // -- Widget principal
    return Obx(() {
      // Antes da última página: botão de próximo
      if (!controller.isLastPage) return nextButton;

      // -- Botão de continuar
      return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: unitCafeteriaController.isSelectionComplete
              // ir pra tela de login
              ? () => controller.finishOnBoarding()
              // desabilitar quando ainda não selecionar
              : null,
          child: const Text(MainTexts.continueT),
        ),
      );
    });
  }
}
