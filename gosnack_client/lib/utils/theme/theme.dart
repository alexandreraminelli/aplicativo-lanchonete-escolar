import 'package:flutter/material.dart';
import 'package:gosnack_client/utils/constants/styles/colors.dart';

/// Tema da aplicação.
class AppTheme {
  AppTheme._(); // Construtor privado para evitar instanciação

  /// Tema da aplicação no modo claro.
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    // -- Cores
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: Colors.white,

    // -- Tipografia
    fontFamily: "Plus Jakarta Sans",

    // -- Widgets do Material Design
  );

  /// Tema da aplicação no modo escuro.
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    // -- Cores
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: Colors.black,

    // -- Tipografia
    fontFamily: "Plus Jakarta Sans",

    // -- Widgets do Material Design
  );
}
