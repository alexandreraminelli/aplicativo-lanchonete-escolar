import 'package:flutter/material.dart';
import 'package:gosnack_client/utils/constants/styles/border.dart';
import 'package:gosnack_client/utils/constants/styles/colors.dart';
import 'package:gosnack_client/utils/constants/styles/spacing.dart';

/// Tema utilizado nos elementos de input do Material.
class AppInputDecorationTheme {
  AppInputDecorationTheme._(); // evitar instanciação

  /// BorderSide com espessura definida e cor personalizada.
  static BorderSide _borderSide({required Color color}) => BorderSide(
    width: KBorder.defaultWidth, // espessura da borda
    color: color,
  );

  /// InputBorder com borda arredondada e cor personalizada.
  static InputBorder _inputBorder({required Color color}) => OutlineInputBorder(
    borderRadius: KBorder.borderRadiusLg, // cantos arredondados
    borderSide: _borderSide(color: color),
  );

  /// Tema base de InputDecorationTheme com propriedades compartilhadas no modo claro e escuro.
  static InputDecorationThemeData _base({
    required Color backgroundColor,
    required Color borderColor,
    required Color focusedBorder,
    required Color textColor,
  }) => InputDecorationThemeData(
    // Bordas
    border: _inputBorder(color: borderColor), // borda padrão
    enabledBorder: _inputBorder(color: borderColor), // borda habilidade
    focusedBorder: _inputBorder(color: focusedBorder), // borda em foco
    errorBorder: _inputBorder(color: KColors.danger), // borda de erro
    focusedErrorBorder: _inputBorder(
      // borda de erro em foco
      color: KColors.warning,
    ),
    // Cores
    filled: true,
    fillColor: backgroundColor, // background
    // Padding
    contentPadding: KSpacing.inputPaddingLg,

    // Tipografia do label
    labelStyle: TextStyle(fontWeight: FontWeight.w600, color: textColor),
  );

  /// Tema de input para o modo claro.
  static final InputDecorationThemeData light = _base(
    backgroundColor: KColors.zinc50,
    borderColor: KColors.zinc200,
    focusedBorder: KColors.black,
    textColor: KColors.zinc600,
  );

  /// Tema de input para o modo escuro.
  static final InputDecorationThemeData dark = _base(
    backgroundColor: KColors.zinc900,
    borderColor: KColors.zinc700,
    focusedBorder: KColors.white,
    textColor: KColors.zinc300,
  );
}
