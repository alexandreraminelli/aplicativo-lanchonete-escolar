import 'package:flutter/material.dart';
import 'package:gosnack_client/utils/constants/styles/colors.dart';
import 'package:gosnack_client/utils/theme/widgets/elevated_button_theme.dart';

/// Tema da aplicação.
class AppTheme {
  AppTheme._(); // Construtor privado para evitar instanciação

  static const String defaultFont = "PlusJakartaSans";

  /// Tema base com as propriedades compartilhadas entre o modo claro e escuro.
  static ThemeData _baseTheme({
    // Cores
    required Brightness brightness,
    required Color scaffoldBackgroundColor,
    // Widgets
    required ElevatedButtonThemeData elevatedButtonTheme,
  }) {
    final base = ThemeData(
      useMaterial3: true,

      // -- Cores
      brightness: brightness,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: scaffoldBackgroundColor,

      // -- Tipografia
      fontFamily: defaultFont,

      // -- Widgets do Material Design
      elevatedButtonTheme: elevatedButtonTheme,
    );

    return base.copyWith(
      textTheme: base.textTheme.apply(fontFamily: defaultFont),
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
  );
}
