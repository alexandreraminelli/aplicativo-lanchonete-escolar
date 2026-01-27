import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:gosnack_client/features/onboarding/presentation/controllers/onboarding_controller.dart';
import 'package:gosnack_client/utils/constants/styles/colors.dart';
import 'package:gosnack_client/utils/constants/styles/sizes.dart';
import 'package:gosnack_client/utils/helpers/helper_functions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

/// Indicador de página para o OnBoarding.
class OnBoardingPageIndicator extends GetView<OnBoardingController> {
  // -- Public Constructor -------------------------------------------------- //
  const OnBoardingPageIndicator({super.key});

  // -- Build Method -------------------------------------------------------- //
  @override
  Widget build(BuildContext context) {
    // -- Tema atual
    final isDark = HelperFunctions.isDarkMode(context);

    // -- Widget principal
    return SmoothPageIndicator(
      controller: controller.pageController, // controlador do PageView
      count: 4, // quantidade de páginas
      // Animação do indicador
      effect: ExpandingDotsEffect(
        dotHeight: KSizes.xs2, // espessura
        // Cor dos pontos:
        dotColor: isDark ? KColors.content4dark : KColors.content4light,
        // Cor do ponto ativo:
        activeDotColor: isDark ? KColors.content1light : KColors.content1dark,
      ),
    );
  }
}
