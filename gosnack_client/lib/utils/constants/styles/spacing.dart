import 'package:flutter/material.dart';
import 'package:gosnack_client/utils/constants/styles/sizes.dart';

/// Contantes de espaçamentos EdgeInsets para padding e margin.
class KSpacing {
  KSpacing._(); // Construtor privado para evitar instanciação

  // -- Buttons ------------------------------------------------------------- //
  static const EdgeInsets buttonPaddingMd = EdgeInsets.symmetric(
    horizontal: Sizes.md,
    vertical: Sizes.sm,
  );
}
