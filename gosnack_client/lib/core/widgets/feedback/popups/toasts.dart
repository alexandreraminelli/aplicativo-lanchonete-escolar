import 'package:flutter/material.dart';
import 'package:gosnack_client/core/constants/styles/colors.dart';
import 'package:gosnack_client/core/constants/styles/sizes.dart';
import 'package:gosnack_client/core/constants/styles/spacing.dart';

/// Utilitário para exibir notificações de SnackBar e Toast.
class AppToasts {
  /// Duração padrão da SnackBar.
  static const _duration = Duration(seconds: 5);

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
