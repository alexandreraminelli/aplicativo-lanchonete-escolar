import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Controlador para a tela de onboarding.
class OnBoardingController extends GetxController {
  // -- Singleton Instance -------------------------------------------------- //
  static OnBoardingController get instance => Get.find();

  // -- Public Instance Variables ------------------------------------------- //

  /// Variável observável com o índice da página atual.
  Rx<int> currentPageIndex = 0.obs;

  /// Controlador de página para o PageView.
  /// Classe controladora no pacote do Material Design.
  final pageController = PageController();

  // -- Public Methods ------------------------------------------------------ //
}
