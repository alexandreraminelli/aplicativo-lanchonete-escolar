import 'package:flutter/material.dart';
import 'package:gosnack_client/core/constants/styles/colors.dart';

/// Esquema de cores da aplicação.
class AppColorScheme {
  /// Esquema de cores base para o modo claro e escuro.
  static ColorScheme _base({
    required Brightness brightness,

    required Color secondary,
    required Color onSecondary,

    required Color surface,
    required Color onSurface,
  }) =>
      ColorScheme.fromSeed(
        brightness: brightness, // brilho (claro ou escuro)
        seedColor: KColors.primary, // cor base
      ).copyWith(
        // Primary
        primary: KColors.primary,
        onPrimary: KColors.primaryForeground,
        // Secondary
        secondary: secondary,
        onSecondary: onSecondary,
        // Surface
        surface: surface,
        onSurface: onSurface,
        // Error
        error: KColors.danger,
        onError: KColors.dangerForeground,
      );

  /// Esquema de cores para o modo claro.
  static final ColorScheme light = _base(
    brightness: Brightness.light,

    secondary: KColors.zinc300,
    onSecondary: KColors.black,

    surface: KColors.white,
    onSurface: KColors.black,
  );

  /// Esquema de cores para o modo escuro.
  static final ColorScheme dark = _base(
    brightness: Brightness.dark,

    secondary: KColors.zinc700,
    onSecondary: KColors.white,

    surface: KColors.black,
    onSurface: KColors.white,
  );
}
