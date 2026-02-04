import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gosnack_client/utils/constants/content/icons.dart';
import 'package:gosnack_client/utils/constants/styles/colors.dart';
import 'package:gosnack_client/utils/constants/styles/shape.dart';
import 'package:gosnack_client/utils/constants/styles/sizes.dart';
import 'package:gosnack_client/utils/constants/styles/spacing.dart';
import 'package:hugeicons/hugeicons.dart';

/// Utilitário para exibir notificações de SnackBar.
abstract class AppSnackBars {
  // -- Config -------------------------------------------------------------- //

  /// Posição padrão da SnackBar.
  static const _position = SnackPosition.TOP;

  /// Direção de dispensa padrão da SnackBar.
  static const _dismissDirection = DismissDirection.up;

  /// Duração padrão da SnackBar.
  static const _duration = Duration(seconds: 5);

  // -- Public Methods ------------------------------------------------------ //

  /// Oculta a SnackBar atualmente exibida.
  static void hideSnackBar(BuildContext context) {
    Get.closeCurrentSnackbar();
  }

  // -- Main SnackBar ------------------------------------------------------- //

  /// Exibe um SnackBar personalizado.
  static void showSnackBar({
    // Content
    required String title,
    required String message,
    List<List<dynamic>> icon = KIcons.info,
    // Botão
    String? buttonText,
    Function()? buttonOnPressed,
    // Colors
    Color backgroundColor = KColors.content2dark,
    Color foregroundColor = KColors.white,
  }) {
    Get.snackbar(
      // Content
      title,
      message,
      // Icon
      icon: HugeIcon(
        icon: icon,
        color: foregroundColor,
        size: KSizes.leadingMd,
      ),
      // Botão
      mainButton: (buttonText != null)
          ? TextButton(
              onPressed: buttonOnPressed, // Ação do botão
              style: TextButton.styleFrom(
                backgroundColor: KColors.primary, // button background
                foregroundColor: KColors.primaryForeground, // button foreground
                padding: KSpacing.horizontalMd,
                shape: KShape.borderRadiusMd,
              ),
              child: Text(buttonText), // Texto do botão
            )
          : null,

      // Colors
      backgroundColor: backgroundColor,
      colorText: foregroundColor,
      // Spacing
      margin: KSpacing.allSm,
      padding: const EdgeInsets.symmetric(
        horizontal: KSizes.lg,
        vertical: KSizes.sm,
      ),

      // Comportamento
      snackPosition: _position,
      dismissDirection: _dismissDirection,
      duration: _duration,
    );
  }

  // -- Predefined SnackBars ------------------------------------------------ //

  /// Exibe um SnackBar de sucesso.
  static void showSuccessSnackBar({
    required String title,
    required String message,
    List<List<dynamic>> icon = KIcons.success,

    String? buttonText,
    Function()? buttonOnPressed,
  }) {
    showSnackBar(
      title: title,
      message: message,
      icon: icon,

      buttonText: buttonText,
      buttonOnPressed: buttonOnPressed,

      backgroundColor: KColors.success900,
      foregroundColor: KColors.success,
    );
  }

  /// Exibe um SnackBar de aviso.
  static void showWarningSnackBar({
    required String title,
    required String message,
    List<List<dynamic>> icon = KIcons.warning,

    String? buttonText,
    Function()? buttonOnPressed,
  }) {
    showSnackBar(
      title: title,
      message: message,
      icon: icon,

      buttonText: buttonText,
      buttonOnPressed: buttonOnPressed,

      backgroundColor: KColors.warning900,
      foregroundColor: KColors.warning,
    );
  }

  /// Exibe um SnackBar de erro.
  static void showErrorSnackBar({
    required String title,
    required String message,
    List<List<dynamic>> icon = KIcons.error,

    String? buttonText,
    Function()? buttonOnPressed,
  }) {
    showSnackBar(
      title: title,
      message: message,
      icon: icon,

      buttonText: buttonText,
      buttonOnPressed: buttonOnPressed,

      backgroundColor: KColors.danger900,
      foregroundColor: KColors.danger,
    );
  }
}
