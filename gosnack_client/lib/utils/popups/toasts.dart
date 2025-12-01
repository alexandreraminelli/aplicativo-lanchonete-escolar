import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gosnack_client/utils/constants/styles/colors.dart';
import 'package:gosnack_client/utils/constants/styles/sizes.dart';
import 'package:gosnack_client/utils/constants/styles/spacing.dart';

/// Utilitário para exibir notificações de SnackBar e Toast.
class AppToasts {
  // -- Private Static Variables -------------------------------------------- //

  // Comportamento da SnackBar
  static const _position = SnackPosition.TOP;
  static const _duration = Duration(seconds: 3);

  static const _titleTextStyle = TextStyle(
    fontSize: KSizes.fontSm,
    fontWeight: FontWeight.w500,
  );

  // -- Public Methods ------------------------------------------------------ //

  /// Oculta a SnackBar atualmente exibida.
  static void hideSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }

  /// Exibe um toast
  static void customToast(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0, // sem sombra
        duration: _duration, // tempo de exibição
        backgroundColor: Colors.transparent,
        behavior: SnackBarBehavior.floating,

        content: Container(
          padding: KSpacing.allSm, // spacing
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(KSizes.radiusLg),
            color: KColors.zinc800.withValues(alpha: 0.8), // background-color
          ),

          // content:
          child: Text(
            message, // Texto do Toast
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.apply(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
