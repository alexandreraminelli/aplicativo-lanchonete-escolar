import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Controlador para a tela de onboarding.
class OnBoardingController extends GetxController {
  // -- Instance Variables -------------------------------------------------- //

  /// Controlador de página para o PageView.
  /// Classe controladora no pacote do Material Design.
  final pageController = PageController();

  // -- Public Constructor -------------------------------------------------- //

  OnBoardingController();

  // -- State Variables ----------------------------------------------------- //

  /// Variável observável com o índice da página atual.
  Rx<int> currentPageIndex = 0.obs;

  // -- Getters ------------------------------------------------------------- //

  /// Se está na última página do OnBoarding.
  bool get isLastPage => currentPageIndex.value == 3;

  // -- Public Methods ------------------------------------------------------ //

  /// Avança para a próxima página do OnBoarding.
  void nextPage() {
    // evitar bugs de avançar para página não existente
    if (!isLastPage) {
      final int page = currentPageIndex.value + 1;
      pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  /// Atualizar o índice da página.
  void updatePageIndicator(int index) => currentPageIndex.value = index;
}
