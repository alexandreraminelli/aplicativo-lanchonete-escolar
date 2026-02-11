import 'package:flutter/material.dart';
import 'package:gosnack_client/core/constants/styles/sizes.dart';

/// Tipografia base do aplicativo.
class AppTypography {
  AppTypography._(); // Construtor privado para evitar instanciação

  /// Fonte padrão do app.
  static const String defaultFont = "Figtree";

  // -- Button Text Styles -------------------------------------------------- //
  static const TextStyle buttonTextStyleMd = TextStyle(
    fontFamily: AppTypography.defaultFont,
    fontSize: KSizes.fontMd,
    fontWeight: FontWeight.w500,
  );
}
