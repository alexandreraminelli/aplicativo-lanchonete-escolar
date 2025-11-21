import 'package:flutter/material.dart';
import 'package:gosnack_client/utils/constants/styles/colors.dart';
import 'package:gosnack_client/utils/theme/base/text_theme.dart';

/// Tema da aplicação.
class AppTheme {
  AppTheme._(); // Construtor privado para evitar instanciação

  /// Tema base com as propriedades compartilhadas entre o modo claro e escuro.
  static ThemeData _baseTheme({
    // Cores
    required Brightness brightness,
    required Color scaffoldBackgroundColor,
    // Tipografia
    required TextTheme textTheme,
    // Widgets
  }) => ThemeData(
    useMaterial3: true,

    // -- Cores
    brightness: brightness,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: scaffoldBackgroundColor,

    // -- Tipografia
    fontFamily: AppTextTheme.defaultFont,
    textTheme: textTheme,

    // -- Widgets do Material Design
  );

  /* ------------------------------------------------------------------------ */
  /// Tema da aplicação no modo claro.
  static final ThemeData lightTheme = _baseTheme(
    // -- Cores
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,

    // -- Tipografia
    textTheme: AppTextTheme.lightTextTheme,

    // -- Widgets do Material Design
  );

  /* ------------------------------------------------------------------------ */
  /// Tema da aplicação no modo escuro.
  static final ThemeData darkTheme = _baseTheme(
    // -- Cores (dark)
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,

    // -- Tipografia
    textTheme: AppTextTheme.darkTextTheme,

    // -- Widgets do Material Design
  );
}
