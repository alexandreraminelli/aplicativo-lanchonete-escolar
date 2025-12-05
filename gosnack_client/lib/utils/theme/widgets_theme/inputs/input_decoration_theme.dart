import 'package:flutter/material.dart';
import 'package:gosnack_client/utils/constants/styles/border.dart';
import 'package:gosnack_client/utils/constants/styles/colors.dart';
import 'package:gosnack_client/utils/constants/styles/sizes.dart';
import 'package:gosnack_client/utils/constants/styles/spacing.dart';

/// Tema utilizado nos elementos de input do Material.
class AppInputDecorationTheme {
  AppInputDecorationTheme._(); // evitar instanciação

  /// Tema base de InputDecorationTheme com propriedades compartilhadas no modo claro e escuro.
  static InputDecorationThemeData _base() => const InputDecorationThemeData(
    // Borda
    border: OutlineInputBorder(
      borderRadius: KBorder.borderRadiusLg, // cantos arredondados
    ),
    // Padding
    contentPadding: KSpacing.inputPaddingLg,

    // Tipografia do label
    labelStyle: TextStyle(fontWeight: FontWeight.w600),
  );

  /// Tema de input para o modo claro.
  static final InputDecorationThemeData light = _base();

  /// Tema de input para o modo escuro.
  static final InputDecorationThemeData dark = _base();
}
