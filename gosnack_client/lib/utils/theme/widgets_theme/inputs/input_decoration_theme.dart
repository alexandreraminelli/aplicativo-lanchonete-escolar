import 'package:flutter/material.dart';
import 'package:gosnack_client/utils/constants/styles/border.dart';
import 'package:gosnack_client/utils/constants/styles/colors.dart';
import 'package:gosnack_client/utils/constants/styles/sizes.dart';
import 'package:gosnack_client/utils/constants/styles/spacing.dart';

/// Tema utilizado nos elementos de input do Material.
class AppInputDecorationTheme {
  AppInputDecorationTheme._(); // evitar instanciação

  // -- Private Variables --------------------------------------------------- //
  static const iconConstraints = BoxConstraints(
    minWidth: KSizes.xl2,
    minHeight: KSizes.leadingLg,
  );

  // -- Private Methods ----------------------------------------------------- //

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

  // -- Base Theme ---------------------------------------------------------- //

  /// Tema base de InputDecorationTheme com propriedades compartilhadas no modo claro e escuro.
  static InputDecorationThemeData _base({
    required Color backgroundColor,
    required Color disabledBackgroundColor,
    required Color borderColor,
    required Color disabledBorderColor,
    required Color textColor,
    required Color disabledTextColor,
  }) {
    /// Cor de foreground. Varia no estado habilitado e desabilitado.
    final foregroundColor = WidgetStateColor.resolveWith(
      (Set<WidgetState> states) =>
          states.contains(WidgetState.disabled) ? disabledTextColor : textColor,
    );

    /// TextStyle com cor que varia no estado habilitado e desabilitado.
    final textStyleColor = WidgetStateTextStyle.resolveWith(
      (Set<WidgetState> states) => TextStyle(
        // Cor do texto habilitada ou desabilitada
        color: states.contains(WidgetState.disabled)
            ? disabledTextColor
            : textColor,
      ),
    );

    /// TextStyle para label.
    final labelTextStyle = WidgetStateTextStyle.resolveWith(
      (Set<WidgetState> states) => TextStyle(
        fontWeight: FontWeight.w600,
        // Cor do texto habilitada ou desabilitada
        color: states.contains(WidgetState.disabled)
            ? disabledTextColor
            : textColor,
      ),
    );

    return InputDecorationThemeData(
      // -- Bordas
      border: _inputBorder(color: borderColor), // borda padrão
      enabledBorder: _inputBorder(color: borderColor), // borda habilitado
      // borda desabilitada
      disabledBorder: _inputBorder(color: disabledBorderColor),
      focusedBorder: _inputBorder(color: KColors.primary), // borda em foco
      errorBorder: _inputBorder(color: KColors.danger), // borda de erro
      // borda de erro em foco
      focusedErrorBorder: _inputBorder(color: KColors.danger),

      // -- Cores
      // background
      filled: true,
      fillColor: WidgetStateColor.resolveWith(
        (Set<WidgetState> states) => states.contains(WidgetState.disabled)
            ? disabledBackgroundColor
            : backgroundColor,
      ),
      // -- Espaçamento
      contentPadding: KSpacing.inputPaddingLg,

      // -- Texto do Label
      // label
      labelStyle: labelTextStyle,
      floatingLabelStyle: labelTextStyle,
      floatingLabelAlignment: FloatingLabelAlignment.start,
      // -- Texto do valor
      hintStyle: textStyleColor,

      // -- Ícones
      // Cor dos ícones
      prefixIconColor: foregroundColor,
      suffixIconColor: foregroundColor,
      // Tamanho dos ícones
      prefixIconConstraints: iconConstraints,
      suffixIconConstraints: iconConstraints,
    );
  }

  // -- Light Theme --------------------------------------------------------- //

  /// Tema de input para o modo claro.
  static final InputDecorationThemeData light = _base(
    backgroundColor: KColors.white,
    disabledBackgroundColor: KColors.zinc50,
    borderColor: KColors.zinc400,
    disabledBorderColor: KColors.zinc200,
    textColor: KColors.zinc700,
    disabledTextColor: KColors.zinc400,
  );

  // -- Dark Theme ---------------------------------------------------------- //

  /// Tema de input para o modo escuro.
  static final InputDecorationThemeData dark = _base(
    backgroundColor: KColors.black,
    disabledBackgroundColor: KColors.zinc900,
    borderColor: KColors.zinc500,
    disabledBorderColor: KColors.zinc700,
    textColor: KColors.zinc300,
    disabledTextColor: KColors.zinc600,
  );
}
