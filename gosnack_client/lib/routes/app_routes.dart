import 'package:get/get.dart';
import 'package:gosnack_client/features/onboarding/screens/onboarding.dart';
import 'package:gosnack_client/routes/routes.dart';

/// Configuração das rotas da aplicação.
class AppRoutes {
  /// Lista de rotas.
  static final pages = [
    // -- Boas-vindas e Autenticação --
    GetPage(name: KRoutes.onBoarding, page: () => const OnBoardingScreen()),

    // -- Telas principais --
  ];
}
