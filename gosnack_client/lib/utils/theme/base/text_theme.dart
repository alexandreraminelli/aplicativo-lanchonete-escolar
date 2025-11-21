import 'package:flutter/material.dart';

/// Tema de texto personalizado do app.
class AppTextTheme {
  AppTextTheme._(); // Construtor privado para evitar instanciação

  static const String defaultFont = "Plus Jakarta Sans";

  /// Tema de texto no modo claro.
  static TextTheme lightTextTheme = TextTheme(
    displayLarge: const TextStyle().copyWith(
      fontSize: 57.0,
      fontWeight: FontWeight.w400,
      color: Colors.black,
      fontFamily: defaultFont,
    ),
    displayMedium: const TextStyle().copyWith(
      fontSize: 45.0,
      fontWeight: FontWeight.w400,
      color: Colors.black,
      fontFamily: defaultFont,
    ),
    displaySmall: const TextStyle().copyWith(
      fontSize: 36.0,
      fontWeight: FontWeight.w400,
      color: Colors.black,
      fontFamily: defaultFont,
    ),

    headlineLarge: const TextStyle().copyWith(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontFamily: defaultFont,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      fontFamily: defaultFont,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      fontFamily: defaultFont,
    ),

    titleLarge: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      fontFamily: defaultFont,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: Colors.black,
      fontFamily: defaultFont,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: Colors.black,
      fontFamily: defaultFont,
    ),

    bodyLarge: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: Colors.black,
      fontFamily: defaultFont,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: Colors.black,
      fontFamily: defaultFont,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: Colors.black.withValues(alpha: 0.5),
      fontFamily: defaultFont,
    ),

    labelLarge: const TextStyle().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: Colors.black,
      fontFamily: defaultFont,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: Colors.black.withValues(alpha: 0.5),
      fontFamily: defaultFont,
    ),
    labelSmall: const TextStyle().copyWith(
      fontSize: 11.0,
      fontWeight: FontWeight.normal,
      color: Colors.black.withValues(alpha: 0.5),
      fontFamily: defaultFont,
    ),
  );

  /// Tema de texto no modo escuro.
  static TextTheme darkTextTheme = TextTheme(
    displayLarge: const TextStyle().copyWith(
      fontSize: 57.0,
      fontWeight: FontWeight.w400,
      color: Colors.white,
      fontFamily: defaultFont,
    ),
    displayMedium: const TextStyle().copyWith(
      fontSize: 45.0,
      fontWeight: FontWeight.w400,
      color: Colors.white,
      fontFamily: defaultFont,
    ),
    displaySmall: const TextStyle().copyWith(
      fontSize: 36.0,
      fontWeight: FontWeight.w400,
      color: Colors.white,
      fontFamily: defaultFont,
    ),

    headlineLarge: const TextStyle().copyWith(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: defaultFont,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      fontFamily: defaultFont,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      fontFamily: defaultFont,
    ),

    titleLarge: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      fontFamily: defaultFont,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: Colors.white,
      fontFamily: defaultFont,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: Colors.white,
      fontFamily: defaultFont,
    ),

    bodyLarge: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: Colors.white,
      fontFamily: defaultFont,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: Colors.white,
      fontFamily: defaultFont,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: Colors.white.withValues(alpha: 0.5),
      fontFamily: defaultFont,
    ),

    labelLarge: const TextStyle().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: Colors.white,
      fontFamily: defaultFont,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: Colors.white.withValues(alpha: 0.5),
      fontFamily: defaultFont,
    ),
    labelSmall: const TextStyle().copyWith(
      fontSize: 11.0,
      fontWeight: FontWeight.normal,
      color: Colors.white.withValues(alpha: 0.5),
      fontFamily: defaultFont,
    ),
  );
}
