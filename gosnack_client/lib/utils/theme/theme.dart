import 'package:flutter/material.dart';
import 'package:gosnack_client/utils/constants/styles/colors.dart';
import 'package:gosnack_client/utils/theme/base/text_theme.dart';

/// Tema da aplicação.
class AppTheme {
  AppTheme._(); // Construtor privado para evitar instanciação

  /// Tema da aplicação no modo claro.
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    // -- Cores
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: Colors.white,

    // -- Tipografia
    fontFamily: AppTextTheme.defaultFont,
    textTheme: AppTextTheme.lightTextTheme,

    // -- Widgets do Material Design
  );

  /// Tema da aplicação no modo escuro.
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    // -- Cores
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: Colors.black,

    // -- Tipografia
    fontFamily: AppTextTheme.defaultFont,
    textTheme: AppTextTheme.darkTextTheme,

    // -- Widgets do Material Design
  );
}
