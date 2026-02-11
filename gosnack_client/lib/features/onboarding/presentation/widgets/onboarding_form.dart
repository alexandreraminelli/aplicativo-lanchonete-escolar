import 'package:flutter/material.dart';
import 'package:gosnack_client/core/widgets/text/section_header.dart';
import 'package:gosnack_client/features/onboarding/presentation/texts/onboarding_texts.dart';
import 'package:gosnack_client/features/unit_cafeteria_selection/presentation/widgets/unit_cafeteria_selector.dart';
import 'package:gosnack_client/core/constants/styles/sizes.dart';
import 'package:gosnack_client/core/constants/styles/spacing.dart';

/// Formulário no final do OnBoarding para selecionar uma unidade e lanchonete.
class OnBoardingForm extends StatelessWidget {
  // -- Public Constructor -------------------------------------------------- //
  const OnBoardingForm({super.key});

  // -- Build Method -------------------------------------------------------- //
  @override
  Widget build(BuildContext context) {
    // -- Widgets internos

    /// Cabeçalho do formulário.
    const formHeader = SectionHeader(
      title: KOnBoardingTexts.onBoardingFormTitle,
      subtitle: KOnBoardingTexts.onBoardingFormSubtitle,
    );

    // -- Widget principal
    return const SingleChildScrollView(
      child: Padding(
        padding: KSpacing.horizontalScreenPadding,
        child: Column(
          children: [
            SizedBox(height: KSizes.xl2),
            formHeader, // header
            SizedBox(height: KSizes.xl),
            UnitCafeteriaSelector(), // form
          ],
        ),
      ),
    );
  }
}
