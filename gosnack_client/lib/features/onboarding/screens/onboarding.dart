import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:gosnack_client/common/widgets/appbar/main_appbar.dart';
import 'package:gosnack_client/features/onboarding/controllers/onboarding_controller.dart';
import 'package:gosnack_client/features/onboarding/screens/widgets/form_unit_and_snackbar.dart';
import 'package:gosnack_client/features/onboarding/screens/widgets/onboarding_buttons.dart';
import 'package:gosnack_client/features/onboarding/screens/widgets/onboarding_page.dart';
import 'package:gosnack_client/features/onboarding/screens/widgets/onboarding_page_indicator.dart';
import 'package:gosnack_client/utils/constants/content/animations_strings.dart';
import 'package:gosnack_client/utils/constants/content/text_strings.dart';
import 'package:gosnack_client/utils/constants/styles/sizes.dart';

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
    final controller = Get.put(OnBoardingController());

    // -- Widgets internos

    /// Carousel de página de onboarding.
    final onBoardingPageView = PageView(
      controller: controller.pageController,
      onPageChanged: controller.updatePageIndicator,

      // -- Lista de páginas
      children: const [
        // -- Páginas de OnBoarding
        OnBoardingPage(
          animation: KAnimations.servingDome,
          title: KTexts.onBoardingTitle1,
          subTitle: KTexts.onBoardingSubTitle1,
        ),
        OnBoardingPage(
          animation: KAnimations.customerMenuOptions,
          title: KTexts.onBoardingTitle2,
          subTitle: KTexts.onBoardingSubTitle2,
        ),
        OnBoardingPage(
          animation: KAnimations.pickingUpOrder,
          title: KTexts.onBoardingTitle3,
          subTitle: KTexts.onBoardingSubTitle3,
        ),
        // -- Form de Unidade e Lanchonete
        FormUnitAndSnackbar(),
      ],
    );

    /// Rodapé da OnBoarding Screen.
    const onBoardingFooter = Padding(
      // padding
      padding: EdgeInsets.only(
        left: KSizes.horizontalScreenPadding,
        right: KSizes.horizontalScreenPadding,
        top: KSizes.xs,
        bottom: KSizes.xl2,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // height-fit
        spacing: KSizes.lg, // gap
        children: [
          OnBoardingPageIndicator(), // indicador
          OnBoardingButtons(), // botão de continuar
        ],
      ),
    );

    // -- Widget principal
    return Scaffold(
      // -- AppBar
      appBar: const MainAppbar(),
      // -- Body
      body: onBoardingPageView,
      // -- Indicador e Botão
      bottomNavigationBar: onBoardingFooter,
    );
  }
}
