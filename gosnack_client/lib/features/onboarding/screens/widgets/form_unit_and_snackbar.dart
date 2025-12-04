import 'package:flutter/material.dart';
import 'package:gosnack_client/common/widgets/text/section_header.dart';
import 'package:gosnack_client/features/onboarding/controllers/onboarding_controller.dart';
import 'package:gosnack_client/utils/constants/content/text_strings.dart';
import 'package:gosnack_client/utils/constants/styles/sizes.dart';
import 'package:gosnack_client/utils/constants/styles/spacing.dart';

/// Formulário no final do OnBoarding para selecionar uma unidade e lanchonete.
class FormUnitAndSnackbar extends StatelessWidget {
  // -- Public Constructor -------------------------------------------------- //
  const FormUnitAndSnackbar({super.key});

  // -- Build Method -------------------------------------------------------- //
  @override
  Widget build(BuildContext context) {
    // -- Controladores
    final onBoardingController = OnBoardingController.instance;

    // -- Widgets internos

    /// Cabeçalho do formulário.
    const formHeader = SectionHeader(
      title: KTexts.onBoardingFormTitle,
      subtitle: KTexts.onBoardingFormSubtitle,
    );

    /// Campos do formulário de unidade e lanchonete.
    const selectUnitAndSnackbarForm = Form(
      child: Column(
        children: [
          // TODO: Form de unidade e lanchonete
          Placeholder(),
        ],
      ),
    );

    // -- Widget principal
    return const Padding(
      padding: KSpacing.horizontalScreenPadding,
      child: Column(
        children: [
          SizedBox(height: KSizes.xl2),
          formHeader, // header
          SizedBox(height: KSizes.xl),
          selectUnitAndSnackbarForm, // form
        ],
      ),
    );
  }
}
