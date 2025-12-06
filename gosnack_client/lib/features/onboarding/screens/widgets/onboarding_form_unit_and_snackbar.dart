import 'package:flutter/material.dart';
import 'package:gosnack_client/common/widgets/text/section_header.dart';
import 'package:gosnack_client/features/onboarding/controllers/onboarding_controller.dart';
import 'package:gosnack_client/utils/constants/content/text_strings.dart';
import 'package:gosnack_client/utils/constants/styles/sizes.dart';
import 'package:gosnack_client/utils/constants/styles/spacing.dart';
import 'package:gosnack_client/utils/helpers/helper_functions.dart';
import 'package:gosnack_client/utils/theme/widgets_theme/inputs/dropdown_menu_theme.dart';

/// Formulário no final do OnBoarding para selecionar uma unidade e lanchonete.
class OnBoardingFormUnitAndSnackbar extends StatelessWidget {
  // -- Public Constructor -------------------------------------------------- //
  const OnBoardingFormUnitAndSnackbar({super.key});

  // -- Build Method -------------------------------------------------------- //
  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    // -- Controladores
    final onBoardingController = OnBoardingController.instance;

    // -- Widgets internos

    /// Cabeçalho do formulário.
    const formHeader = SectionHeader(
      title: KTexts.onBoardingFormTitle,
      subtitle: KTexts.onBoardingFormSubtitle,
    );

    /// Campos do formulário de unidade e lanchonete.
    final selectUnitAndSnackbarForm = Form(
      child: Column(
        spacing: KSizes.spacingBtwFields,
        children: [
          // TODO: Form de unidade e lanchonete
          // -- Select Unidade
          DropdownMenu(
            label: const Text("Unidade"),
            // Passar context para calcular a width do menu
            menuStyle: isDark
                ? AppDropdownMenuTheme.darkMenuStyle(context)
                : AppDropdownMenuTheme.lightMenuStyle(context),
            width: double.infinity, // largura total
            // TODO: Obter lanchonetes do controlador
            dropdownMenuEntries: const [
              DropdownMenuEntry(value: 'unit1', label: 'Unidade 1'),
              DropdownMenuEntry(value: 'unit2', label: 'Unidade 2'),
              DropdownMenuEntry(value: 'unit3', label: 'Unidade 3'),
              DropdownMenuEntry(value: 'unit4', label: 'Unidade 4'),
            ],
          ),

          // -- Select Lanchonete
          DropdownMenu(
            label: const Text("Lanchonete"),
            // Passar context para calcular a width do menu
            menuStyle: isDark
                ? AppDropdownMenuTheme.darkMenuStyle(context)
                : AppDropdownMenuTheme.lightMenuStyle(context),
            width: double.infinity, // largura total
            // TODO: Obter lanchonetes do controlador
            dropdownMenuEntries: const [
              DropdownMenuEntry(value: "snackbar1", label: "Lanchonete 1"),
              DropdownMenuEntry(value: "snackbar2", label: "Lanchonete 2"),
              DropdownMenuEntry(value: "snackbar3", label: "Lanchonete 3"),
            ],
          ),
        ],
      ),
    );

    // -- Widget principal
    return SingleChildScrollView(
      child: Padding(
        padding: KSpacing.horizontalScreenPadding,
        child: Column(
          children: [
            const SizedBox(height: KSizes.xl2),
            formHeader, // header
            const SizedBox(height: KSizes.xl),
            selectUnitAndSnackbarForm, // form
          ],
        ),
      ),
    );
  }
}
