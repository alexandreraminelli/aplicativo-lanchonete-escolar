import 'package:flutter/material.dart';
import 'package:gosnack_client/utils/constants/styles/colors.dart';
import 'package:gosnack_client/utils/constants/styles/sizes.dart';
import 'package:gosnack_client/utils/constants/styles/spacing.dart';
import 'package:gosnack_client/utils/theme/theme.dart';

/// Tema personalizado para ElevatedButton.
/// Usado como botão primário na aplicação.
class AppElevatedButtonTheme {
  AppElevatedButtonTheme._(); // Construtor privado para evitar instanciação

  /// Tema base do botão primário.
  static final _baseElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 1, // sombra
      // Cores
      backgroundColor: KColors.primary,
      foregroundColor: KColors.primaryForeground,
      disabledBackgroundColor: Colors.grey,
      disabledForegroundColor: Colors.white70,
      // Padding
      padding: KSpacing.buttonPaddingMd,
      // Tipografia
      textStyle: const TextStyle(
        fontFamily: AppTheme.defaultFont,
        fontSize: 16.0,
        fontWeight: FontWeight.normal,
      ),
      // Cantos arredondados
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(KSizes.sm),
      ),
    ),
  );

  /// Tema do botão primário no modo claro.
  static final lightElevatedButtonTheme = _baseElevatedButtonTheme;

  /// Tema do botão primário no modo escuro.
  static final darkElevatedButtonTheme = _baseElevatedButtonTheme;
}
