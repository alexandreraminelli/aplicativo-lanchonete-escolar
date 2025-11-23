import 'package:flutter/material.dart';

/// Tipografia base do aplicativo.
class AppTypography {
  AppTypography._(); // Construtor privado para evitar instanciação

  /// Fonte padrão do app.
  static const String defaultFont = "PlusJakartaSans";

  // -- Button Text Styles -------------------------------------------------- //
  static const TextStyle buttonTextStyleMd = TextStyle(
    fontFamily: AppTypography.defaultFont,
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
  );
}
