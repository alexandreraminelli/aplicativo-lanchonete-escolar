import 'package:get/get.dart';
import 'package:gosnack_client/features/authentication/presentation/screens/login_screen.dart';
import 'package:gosnack_client/features/onboarding/presentation/screens/onboarding.dart';
import 'package:gosnack_client/features/unit_cafeteria_selection/presentation/bindings/unit_cafeteria_selection_binding.dart';
import 'package:gosnack_client/routes/routes.dart';

/// Configuração das rotas da aplicação.
class AppRoutes {
  /// Lista de rotas.
  static final pages = [
    // -- Onboarding -------------------------------------------------------- //
    GetPage(
      name: KRoutes.onBoarding,
      page: () => const OnBoardingScreen(),
      binding: UnitCafeteriaSelectionBinding(),
    ),

    // -- Authentication ---------------------------------------------------- //
    // Login
    GetPage(name: KRoutes.signin, page: () => const LoginScreen()),

    // -- Main Screens ------------------------------------------------------ //
  ];
}
