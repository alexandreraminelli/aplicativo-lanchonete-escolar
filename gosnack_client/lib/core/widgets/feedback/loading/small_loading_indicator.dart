import 'package:flutter/material.dart';
import 'package:gosnack_client/core/constants/styles/colors.dart';
import 'package:gosnack_client/core/constants/styles/sizes.dart';

/// Indicador de carregamento circular pequeno.
///
/// Usado em botões e
class SmallLoadingIndicator extends StatelessWidget {
  // -- Instance Variables -------------------------------------------------- //

  /// Cor do indicador.
  final Color color;

  // -- Public Constructor -------------------------------------------------- //

  const SmallLoadingIndicator({super.key, this.color = KColors.primary});

  // -- Build Method -------------------------------------------------------- //
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: KSizes.fontLg,
      height: KSizes.fontLg,
      child: CircularProgressIndicator(strokeWidth: 2, color: color),
    );
  }
}
