import 'package:flutter/material.dart';
import 'package:gosnack_client/utils/constants/styles/sizes.dart';
import 'package:gosnack_client/utils/constants/styles/spacing.dart';
import 'package:lottie/lottie.dart';

/// Página de onboarding com animação, título e subtítulo.
class OnBoardingPage extends StatelessWidget {
  // -- Public Constructor -------------------------------------------------- //
  const OnBoardingPage({
    required this.animation,
    required this.title,
    required this.subTitle,
    super.key,
  });

  // -- Public Instance Variables ------------------------------------------- //

  final String animation;
  final String title;
  final String subTitle;

  // -- Build Method -------------------------------------------------------- //
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    // -- Widgets internos

    /// Animação Lottie
    final lottieAnimation = Lottie.asset(animation);

    /// Título do onBoarding
    final titleWidget = Text(
      title,
      textAlign: TextAlign.center,
      style: textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold),
    );

    /// Subtítulo do onBoarding
    final subtitleWidget = Text(
      subTitle,
      textAlign: TextAlign.center,
      style: textTheme.bodyLarge,
    );

    // -- Widget Principal
    return SingleChildScrollView(
      child: Padding(
        padding: KSpacing.horizontalSm, // espaçamento
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            lottieAnimation, // animação

            titleWidget, // título
            const SizedBox(height: KSizes.sm),
            subtitleWidget, // subtítulo

            const SizedBox(height: KSizes.xl2),
          ],
        ),
      ),
    );
  }
}
