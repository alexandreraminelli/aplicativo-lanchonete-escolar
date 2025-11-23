import 'package:flutter/material.dart';
import 'package:gosnack_client/utils/constants/styles/colors.dart';
import 'package:gosnack_client/utils/constants/styles/sizes.dart';
import 'package:gosnack_client/utils/constants/styles/spacing.dart';
import 'package:gosnack_client/utils/theme/base/typography.dart';

/// Tema personalizado para OutlinedButton.
class AppOutlinedButtonTheme {
  AppOutlinedButtonTheme._(); // Construtor privado para evitar instanciação

  /// Tema base do botão de borda.
  static OutlinedButtonThemeData _baseOutlinedButtonTheme({
    required Color foregroundColor,
    required Color borderColor,
  }) => OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      // Cores
      foregroundColor: foregroundColor,
      // Borda
      side: BorderSide(width: 2, color: borderColor),
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

  /// Tema do botão de borda no modo claro.
  static final lightOutlinedButtonTheme = _baseOutlinedButtonTheme(
    foregroundColor: Colors.black,
    borderColor: KColors.zinc300,
  );

  /// Tema do botão de borda no modo escuro.
  static final darkOutlinedButtonTheme = _baseOutlinedButtonTheme(
    foregroundColor: Colors.white,
    borderColor: KColors.zinc700,
  );
}
