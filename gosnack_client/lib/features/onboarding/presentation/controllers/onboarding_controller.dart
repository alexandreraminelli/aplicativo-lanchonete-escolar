import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gosnack_client/features/onboarding/domain/use_cases/complete_onboarding_usecase.dart';
import 'package:gosnack_client/features/cafeteria_selection/presentation/controllers/unit_cafeteria_selection_controller.dart';
import 'package:gosnack_client/core/routing/routes.dart';
import 'package:gosnack_client/core/resources/strings/error_texts.dart';
import 'package:gosnack_client/core/logging/logger.dart';
import 'package:gosnack_client/core/widgets/feedback/snackbars.dart';

/// Controlador para a tela de onboarding.
class OnBoardingController extends GetxController {
  // -- Use Cases Variables ------------------------------------------------- //

  final CompleteOnboardingUseCase _completeOnboardingUseCase;

  // -- Public Instance Variables ------------------------------------------- //

  /// Controlador de página para o PageView.
  /// Classe controladora no pacote do Material Design.
  final pageController = PageController();

  // -- Private Instance Variables ------------------------------------------ //

  /// Controlador de seleção de unidade e lanchonete.
  final UnitCafeteriaSelectionController _selectionController =
      Get.find<UnitCafeteriaSelectionController>();

  // -- Public Constructor -------------------------------------------------- //

  OnBoardingController(this._completeOnboardingUseCase);

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

      // Marcar o OnBoarding como concluído
      await _completeOnboardingUseCase.call();

      // Ir para a tela de login
      Get.offAllNamed(KRoutes.signin);
    } catch (e) {
      LoggerHelp.error('Erro ao finalizar o onboarding: $e');
      AppSnackBars.showErrorSnackBar(
        title: ErrorTexts.genericErrorMessage,
        message: '',
      );
    }
  }
}
