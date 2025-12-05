import 'package:flutter/material.dart';
import 'package:gosnack_client/utils/theme/base/color_scheme.dart';
import 'package:gosnack_client/utils/theme/base/typography.dart';
import 'package:gosnack_client/utils/theme/widgets_theme/buttons_theme/elevated_button_theme.dart';
import 'package:gosnack_client/utils/theme/widgets_theme/buttons_theme/filled_button_theme.dart';
import 'package:gosnack_client/utils/theme/widgets_theme/buttons_theme/outlined_button_theme.dart';
import 'package:gosnack_client/utils/theme/widgets_theme/inputs/dropdown_menu_theme.dart';
import 'package:gosnack_client/utils/theme/widgets_theme/inputs/input_decoration_theme.dart';

/// Tema da aplicação.
class AppTheme {
  AppTheme._(); // Construtor privado para evitar instanciação

  /// Tema base com as propriedades compartilhadas entre o modo claro e escuro.
  static ThemeData _baseTheme({
    // Cores
    required ColorScheme colorScheme,

    // Widgets
    // Buttons
    required ElevatedButtonThemeData elevatedButtonTheme,
    required FilledButtonThemeData filledButtonTheme,
    required OutlinedButtonThemeData outlinedButtonTheme,
    // Inputs
    required InputDecorationThemeData inputDecorationTheme,
    required DropdownMenuThemeData dropdownMenuTheme,
  }) {
    final base = ThemeData(
      useMaterial3: true,

      // -- Cores
      colorScheme: colorScheme,

      // -- Tipografia
      fontFamily: AppTypography.defaultFont,

      // -- Widgets do Material Design
      // Buttons
      elevatedButtonTheme: elevatedButtonTheme,
      filledButtonTheme: filledButtonTheme,
      outlinedButtonTheme: outlinedButtonTheme,
      // Inputs
      inputDecorationTheme: inputDecorationTheme,
      dropdownMenuTheme: dropdownMenuTheme,
    );

    return base.copyWith(
      textTheme: base.textTheme.apply(fontFamily: AppTypography.defaultFont),
    );
  }

  /* ------------------------------------------------------------------------ */
  /// Tema da aplicação no modo claro.
  static final ThemeData lightTheme = _baseTheme(
    // -- Cores (light)
    colorScheme: AppColorScheme.light,

    // -- Widgets do Material Design
    // Buttons (light)
    elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
    filledButtonTheme: AppFilledButtonTheme.lightFilledButtonTheme,
    outlinedButtonTheme: AppOutlinedButtonTheme.lightOutlinedButtonTheme,

    // Inputs (light)
    inputDecorationTheme: AppInputDecorationTheme.light,
    dropdownMenuTheme: AppDropdownMenuTheme.light,
  );

  /* ------------------------------------------------------------------------ */
  /// Tema da aplicação no modo escuro.
  static final ThemeData darkTheme = _baseTheme(
    // -- Cores (dark)
    colorScheme: AppColorScheme.dark,

    // -- Widgets do Material Design
    // Buttons (dark)
    elevatedButtonTheme: AppElevatedButtonTheme.darkElevatedButtonTheme,
    filledButtonTheme: AppFilledButtonTheme.darkFilledButtonTheme,
    outlinedButtonTheme: AppOutlinedButtonTheme.darkOutlinedButtonTheme,
    // Inputs (dark)
    inputDecorationTheme: AppInputDecorationTheme.dark,
    dropdownMenuTheme: AppDropdownMenuTheme.dark,
  );
}
