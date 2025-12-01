import 'package:flutter/material.dart';
import 'package:gosnack_client/utils/constants/styles/sizes.dart';

/// Contantes de espaçamentos EdgeInsets para padding e margin.
class KSpacing {
  KSpacing._(); // Construtor privado para evitar instanciação

  // -- Espaçamentos Gerais ------------------------------------------------- //
  static const EdgeInsets allXs = EdgeInsets.all(KSizes.xs);
  static const EdgeInsets allSm = EdgeInsets.all(KSizes.sm);
  static const EdgeInsets allMd = EdgeInsets.all(KSizes.md);
  static const EdgeInsets allLg = EdgeInsets.all(KSizes.lg);
  static const EdgeInsets allXl = EdgeInsets.all(KSizes.xl);
  static const EdgeInsets allXl2 = EdgeInsets.all(KSizes.xl2);
  static const EdgeInsets allXl3 = EdgeInsets.all(KSizes.xl3);
  static const EdgeInsets allXl4 = EdgeInsets.all(KSizes.xl4);
  static const EdgeInsets allXl5 = EdgeInsets.all(KSizes.xl5);
  static const EdgeInsets allXl6 = EdgeInsets.all(KSizes.xl6);
  static const EdgeInsets allXl7 = EdgeInsets.all(KSizes.xl7);
  static const EdgeInsets allXl8 = EdgeInsets.all(KSizes.xl8);
  static const EdgeInsets allXl9 = EdgeInsets.all(KSizes.xl9);

  // -- Buttons ------------------------------------------------------------- //
  static const EdgeInsets buttonPaddingMd = EdgeInsets.symmetric(
    horizontal: KSizes.md,
    vertical: KSizes.sm,
  );
}
