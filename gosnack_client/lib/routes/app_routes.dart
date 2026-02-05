import 'package:get/get.dart';
import 'package:gosnack_client/features/authentication/presentation/bindings/authentication_bindings.dart';
import 'package:gosnack_client/features/authentication/presentation/bindings/signup_binding.dart';
import 'package:gosnack_client/features/authentication/presentation/screens/login_screen.dart';
import 'package:gosnack_client/features/authentication/presentation/screens/signup_screen.dart';
import 'package:gosnack_client/features/authentication/presentation/screens/verify_email_screen.dart';
import 'package:gosnack_client/features/home/presentation/screens/home_screen.dart';
import 'package:gosnack_client/features/onboarding/presentation/screens/onboarding.dart';
import 'package:gosnack_client/features/unit_cafeteria_selection/unit_cafeteria_selection_binding.dart';
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
    // Criar Conta
    GetPage(
      name: KRoutes.signup,
      page: () => const SignUpScreen(),
      bindings: [AuthenticationBinding(), SignUpBinding()],
    ),
    // Verificar e-mail
    GetPage(name: KRoutes.verifyEmail, page: () => const VerifyEmailScreen()),

    // -- Main Screens ------------------------------------------------------ //
    // Home
    GetPage(name: KRoutes.home, page: () => const HomeScreen()),
  ];
}
