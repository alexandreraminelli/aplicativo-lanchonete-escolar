import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gosnack_client/features/unit_cafeteria_selection/presentation/controllers/unit_cafeteria_selection_controller.dart';
import 'package:gosnack_client/routes/routes.dart';
import 'package:logger/logger.dart';

/// Controlador para a tela de onboarding.
class OnBoardingController extends GetxController {
  // -- Public Instance Variables ------------------------------------------- //

  /// Controlador de página para o PageView.
  /// Classe controladora no pacote do Material Design.
  final pageController = PageController();

  // -- Private Instance Variables ------------------------------------------ //

  final Logger _logger = Logger();

  /// Controlador de seleção de unidade e lanchonete.
  final UnitCafeteriaSelectionController _selectionController =
      Get.find<UnitCafeteriaSelectionController>();

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

  /// Finaliza o OnBoarding.
  /// 1. Salva as seleções de unidade e lanchonetes.
  /// 2. Marca o OnBoarding como concluído.
  /// 3. Navega para a tela de login.
  Future<void> finishOnBoarding() async {
    try {
      // Verificar se a seleção de unidades e lanchonete está completa
      if (!_selectionController.isSelectionComplete) {
        // TODO: Usar AppToasts
        Get.snackbar(
          'Seleção Incompleta',
          'Selecione uma unidade e uma lanchonete para continuar',
        );
        return;
      }
      // Salvar as seleções de unidade e lanchonetes
      await _selectionController.saveSelections();

      // TODO: Marcar o OnBoarding como concluído

      // Ir para a tela de login
      Get.offAllNamed(KRoutes.signin);
    } catch (e) {
      _logger.e('Erro ao finalizar o onboarding: $e');
      // TODO: Usar AppToasts
      Get.snackbar('Erro', 'Não foi possível finalizar o onboarding: $e');
    }
  }
}
