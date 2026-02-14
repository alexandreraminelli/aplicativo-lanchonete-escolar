import 'package:get/get.dart';
import 'package:gosnack_client/core/routing/routes.dart';
import 'package:gosnack_client/features/authentication/presentation/bindings/login_bindings.dart';
import 'package:gosnack_client/features/authentication/presentation/bindings/signup_binding.dart';
import 'package:gosnack_client/features/authentication/presentation/screens/login_screen.dart';
import 'package:gosnack_client/features/authentication/presentation/screens/signup_screen.dart';
import 'package:gosnack_client/features/authentication/presentation/screens/verify_email_screen.dart';
import 'package:gosnack_client/features/cafeteria_selection/presentation/bindings/unit_cafeteria_selection_binding.dart';
import 'package:gosnack_client/features/home/presentation/screens/home_screen.dart';
import 'package:gosnack_client/features/onboarding/presentation/bindings/onboarding_binding.dart';
import 'package:gosnack_client/features/onboarding/presentation/screens/onboarding_screen.dart';

/// Configuração das rotas da aplicação.
class AppRoutes {
  /// Lista de rotas.
  static final pages = [
    // -- Onboarding -------------------------------------------------------- //
    GetPage(
      name: KRoutes.onBoarding,
      page: () => const OnBoardingScreen(),
      bindings: [OnBoardingBinding(), UnitCafeteriaSelectionBinding()],
    ),

    // -- Authentication ---------------------------------------------------- //
    // Login
    GetPage(
      name: KRoutes.signin,
      page: () => const LoginScreen(),
      binding: LoginBindings(),
    ),
    // Criar Conta
    GetPage(
      name: KRoutes.signup,
      page: () => const SignUpScreen(),
      binding: SignUpBinding(),
    ),
    // Verificar e-mail
    GetPage(name: KRoutes.verifyEmail, page: () => const VerifyEmailScreen()),

    // -- Main Screens ------------------------------------------------------ //
    // Home
    GetPage(name: KRoutes.home, page: () => const HomeScreen()),
  ];
}
