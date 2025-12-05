import 'package:flutter/material.dart';
import 'package:gosnack_client/utils/constants/styles/sizes.dart';

/// Instâncias pré-definidas de formatos.
class KShape {
  KShape._(); // evitar instanciação

  // -- Cantos arredondados ------------------------------------------------- //
  static final borderRadiusSm = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(KSizes.radiusSm),
  );
  static final borderRadiusMd = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(KSizes.radiusMd),
  );
  static final borderRadiusLg = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(KSizes.radiusLg),
  );
  static final borderRadiusFull = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(KSizes.radiusFull),
  );
}
