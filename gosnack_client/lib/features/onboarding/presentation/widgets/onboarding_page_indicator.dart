import 'package:flutter/material.dart';
import 'package:gosnack_client/features/onboarding/presentation/controllers/onboarding_controller.dart';
import 'package:gosnack_client/utils/constants/styles/colors.dart';
import 'package:gosnack_client/utils/constants/styles/sizes.dart';
import 'package:gosnack_client/utils/helpers/helper_functions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

/// Indicador de página para o OnBoarding.
class OnBoardingPageIndicator extends StatelessWidget {
  // -- Public Constructor -------------------------------------------------- //
  const OnBoardingPageIndicator({super.key});

  // -- Build Method -------------------------------------------------------- //
  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;

    final isDark = HelperFunctions.isDarkMode(context);

    // -- Widget principal
    return SmoothPageIndicator(
      controller: controller.pageController, // controlador do PageView
      count: 4, // quantidade de páginas
      // Animação do indicador
      effect: ExpandingDotsEffect(
        dotHeight: KSizes.xs2, // espessura
        dotColor: isDark ? KColors.content4dark : KColors.content4light,
        activeDotColor: isDark ? KColors.content1light : KColors.content1dark,
      ),
    );
  }
}
