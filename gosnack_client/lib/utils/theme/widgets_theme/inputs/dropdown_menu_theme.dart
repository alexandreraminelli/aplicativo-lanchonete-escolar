import 'package:flutter/material.dart';
import 'package:gosnack_client/utils/theme/widgets_theme/inputs/input_decoration_theme.dart';

/// Tema do DropdownMenu da aplicação.
class AppDropdownMenuTheme {
  AppDropdownMenuTheme._(); // evitar instanciação

  /// Tema base do DropdownMenuTheme com propriedades compartilhadas no modo claro e escuro.
  static DropdownMenuThemeData _base({
    required InputDecorationThemeData inputDecorationTheme,
  }) => DropdownMenuThemeData(inputDecorationTheme: inputDecorationTheme);

  /// Tema do DropdownMenu no modo claro.
  static final DropdownMenuThemeData light = _base(
    inputDecorationTheme: AppInputDecorationTheme.light,
  );

  /// Tema do DropdownMenu no modo escuro.
  static final DropdownMenuThemeData dark = _base(
    inputDecorationTheme: AppInputDecorationTheme.dark,
  );
}
