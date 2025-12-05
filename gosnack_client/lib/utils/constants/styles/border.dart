import 'package:flutter/material.dart';
import 'package:gosnack_client/utils/constants/styles/sizes.dart';

/// Constantes de estilo para bordas.
class KBorder {
  KBorder._(); // evitar instanciação

  // -- Border Radius ------------------------------------------------------- //
  static const BorderRadius borderRadiusSm = BorderRadius.all(
    Radius.circular(KSizes.radiusSm),
  );
  static const BorderRadius borderRadiusMd = BorderRadius.all(
    Radius.circular(KSizes.radiusMd),
  );
  static const BorderRadius borderRadiusLg = BorderRadius.all(
    Radius.circular(KSizes.radiusLg),
  );
  static const BorderRadius borderRadiusFull = BorderRadius.all(
    Radius.circular(KSizes.radiusFull),
  );
}
