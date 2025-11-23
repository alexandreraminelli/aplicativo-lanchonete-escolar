import 'package:flutter/material.dart';
import 'package:gosnack_client/utils/constants/styles/colors.dart';
import 'package:gosnack_client/utils/theme/base/typography.dart';
import 'package:gosnack_client/utils/theme/widgets_theme/buttons_theme/elevated_button_theme.dart';
import 'package:gosnack_client/utils/theme/widgets_theme/buttons_theme/filled_button_theme.dart';

/// Tema da aplicação.
class AppTheme {
  AppTheme._(); // Construtor privado para evitar instanciação

  /// Tema base com as propriedades compartilhadas entre o modo claro e escuro.
  static ThemeData _baseTheme({
    // Cores
    required Brightness brightness,
    required Color scaffoldBackgroundColor,
    // Widgets
    required ElevatedButtonThemeData elevatedButtonTheme,
    required FilledButtonThemeData filledButtonTheme,
  }) {
    final base = ThemeData(
      useMaterial3: true,

      // -- Cores
      brightness: brightness,
      primaryColor: KColors.primary,
      scaffoldBackgroundColor: scaffoldBackgroundColor,

      // -- Tipografia
      fontFamily: AppTypography.defaultFont,

      // -- Widgets do Material Design
      elevatedButtonTheme: elevatedButtonTheme,
      filledButtonTheme: filledButtonTheme,
    );

    return base.copyWith(
      textTheme: base.textTheme.apply(fontFamily: AppTypography.defaultFont),
    );
  }

  /* ------------------------------------------------------------------------ */
  /// Tema da aplicação no modo claro.
  static final ThemeData lightTheme = _baseTheme(
    // -- Cores
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,

    // -- Widgets do Material Design
    // Botões
    elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
    filledButtonTheme: AppFilledButtonTheme.lightFilledButtonTheme,
  );

  /* ------------------------------------------------------------------------ */
  /// Tema da aplicação no modo escuro.
  static final ThemeData darkTheme = _baseTheme(
    // -- Cores (dark)
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,

    // -- Widgets do Material Design
    // Botões
    elevatedButtonTheme: AppElevatedButtonTheme.darkElevatedButtonTheme,
    filledButtonTheme: AppFilledButtonTheme.darkFilledButtonTheme,
  );
}
