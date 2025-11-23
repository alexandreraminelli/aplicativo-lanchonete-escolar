import 'package:flutter/material.dart';
import 'package:gosnack_client/utils/constants/styles/colors.dart';
import 'package:gosnack_client/utils/constants/styles/sizes.dart';
import 'package:gosnack_client/utils/constants/styles/spacing.dart';
import 'package:gosnack_client/utils/theme/base/typography.dart';

/// Tema personalizado para FilledButton.
/// Usado como botão secundário na aplicação.
class AppFilledButtonTheme {
  AppFilledButtonTheme._(); // Construtor privado para evitar instanciação

  /// Tema base do botão primário.
  static FilledButtonThemeData _baseFilledButtonTheme({
    required Color backgroundColor,
    required Color foregroundColor,
  }) => FilledButtonThemeData(
    style: FilledButton.styleFrom(
      elevation: 1, // sombra
      // Cores
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      disabledBackgroundColor: Colors.grey,
      disabledForegroundColor: Colors.white70,
      // Padding
      padding: KSpacing.buttonPaddingMd,
      // Tipografia
      textStyle: AppTypography.buttonTextStyleMd,
      // Cantos arredondados
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(KSizes.sm),
      ),
    ),
  );

  /// Tema do botão primário no modo claro.
  static final lightFilledButtonTheme = _baseFilledButtonTheme(
    backgroundColor: KColors.zinc300,
    foregroundColor: Colors.black,
  );

  /// Tema do botão primário no modo escuro.
  static final darkFilledButtonTheme = _baseFilledButtonTheme(
    backgroundColor: KColors.zinc700,
    foregroundColor: Colors.white,
  );
}
