import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

/// Utilitário para operações relacionadas ao dispositivo.
class DeviceUtils {
  /// Esconder o teclado virtual  .
  static void hideKeyboard([BuildContext? context]) {
    if (context != null) {
      FocusScope.of(context).requestFocus(FocusNode());
    } else {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  /// Alterar a cor da barra de status.
  static Future<void> setStatusBarColor(Color color) async {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: color),
    );
  }

  /// Verificar se a orientação do dispositivo está em paisagem.
  static bool isLandscapeOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom == 0;
  }

  /// Verificar se a orientação do dispositivo está em retrato.
  static bool isPortraitOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom != 0;
  }

  /// Ativar ou desativar o modo de tela cheia.
  static void setFullScreen({required bool enable}) {
    SystemChrome.setEnabledSystemUIMode(
      enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge,
    );
  }

  /// Obter a largura da tela do dispositivo.
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /// Obter a altura da tela do dispositivo.
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// Obter a densidade de pixels do dispositivo.
  static double getPixelRatio() {
    return MediaQuery.of(Get.context!).devicePixelRatio;
  }

  /// Obter a altura da barra de status do dispositivo.
  static double getStatusBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  /// Obter a altura da barra de navegação inferior do dispositivo.
  static double getBottomNavigationBarHeight() {
    return kBottomNavigationBarHeight;
  }

  /// Obter a altura da AppBar padrão.
  static double getAppBarHeight() {
    return kToolbarHeight;
  }

  /// Obter a altura do teclado virtual.
  static double getKeyboardHeight() {
    final viewInsets = MediaQuery.of(Get.context!).viewInsets;
    return viewInsets.bottom;
  }

  /// Verificar se o teclado virtual está visível.
  static Future<bool> isKeyboardVisible(BuildContext context) async {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom > 0;
  }

  /// Verificar se o dispositivo é físico (não é um emulador ou simulador).
  static Future<bool> isPhysicalDevice() async {
    return defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS;
  }

  /// Vibrar o dispositivo por uma duração específica.
  static void vibrate(Duration duration) {
    HapticFeedback.vibrate();
    Future.delayed(duration, () => HapticFeedback.vibrate());
  }

  /// Definir as orientações preferidas do dispositivo.
  static Future<void> setPreferredOrientations(
    List<DeviceOrientation> orientations,
  ) async {
    await SystemChrome.setPreferredOrientations(orientations);
  }

  /// Esconder a barra de status.
  static void hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  /// Mostrar a barra de status.
  static void showStatusBar() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
  }

  /// Verificar se há conexão com a internet.
  static Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup("example.com");
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  /// Verifica se o dispositivo usa o SO iOS (iPhone/iPad).
  static bool isIOS() {
    return Platform.isIOS;
  }

  /// Verifica se o dispositivo usa o SO Android.
  static bool isAndroid() {
    return Platform.isAndroid;
  }

  /// Abre uma URL no navegador padrão do dispositivo.
  static void launchUrl(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
