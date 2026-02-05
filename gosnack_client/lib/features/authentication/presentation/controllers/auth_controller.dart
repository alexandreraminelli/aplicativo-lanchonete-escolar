import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:gosnack_client/features/authentication/domain/use_cases/check_authentication_status_usecase.dart';
import 'package:gosnack_client/features/authentication/domain/use_cases/screen_redirect_usecase.dart';
import 'package:gosnack_client/features/authentication/domain/use_cases/signin_usecase.dart';
import 'package:gosnack_client/features/authentication/domain/use_cases/signout_usecase.dart';
import 'package:gosnack_client/routes/routes.dart';
import 'package:logger/logger.dart';

/// Controlador responsável por gerenciar o estado de autenticação na
/// camada de apresentação.
class AuthController extends GetxController {
  // -- Use Cases ----------------------------------------------------------- //

  final ScreenRedirectUseCase _screenRedirectUseCase;
  final LoginUseCase _loginUseCase;
  final LogoutUseCase _logoutUseCase;
  final CheckAuthenticationStatusUsecase _checkAuthenticationStatusUseCase;

  // -- Private Instance Variables ------------------------------------------ //

  final Logger _logger = Logger();

  // -- Public Constructor -------------------------------------------------- //

  AuthController(
    this._screenRedirectUseCase,
    this._loginUseCase,
    this._logoutUseCase,
    this._checkAuthenticationStatusUseCase,
  );

  // -- Lifecycle Methods --------------------------------------------------- //

  /// Método chamado quando o controlador está pronto para uso.
  @override
  void onReady() {
    super.onReady();

    FlutterNativeSplash.remove(); // Remove a splash screen imediatamente

    // Redirecionar para a tela apropriada de forma assíncrona
    Future.microtask(() => screenRedirect());
  }

  /// -- Public Methods ----------------------------------------------------- //

  /// Redireciona para a tela apropriada com base no estado de autenticação.
  Future<void> screenRedirect() async {
    try {
      final route = await _screenRedirectUseCase();
      Get.offAllNamed(route);
    } catch (e) {
      // Em caso de erro, ir para o login
      _logger.e('Erro ao redirecionar tela: $e');
      await Get.offAllNamed(KRoutes.signin);
    }
  }

  /// Efetua o login do usuário com as credenciais fornecidas.
  ///
  /// Em caso de sucesso, redireciona para a tela apropriada.
  Future<void> login(String email, String password) async {
    try {
      await _loginUseCase(email: email, password: password);
      await screenRedirect();
    } catch (e) {
      // TODO: usar constantes de texto
      Get.snackbar('Erro', 'Falha ao fazer login: $e');
    }
  }

  /// Efetua o logout do usuário e redireciona para a tela apropriada.
  Future<void> logout() async {
    try {
      await _logoutUseCase();
      await screenRedirect();
    } catch (e) {
      // TODO: usar constantes de texto
      Get.snackbar('Erro', 'Falha ao fazer logout: $e');
    }
  }

  /// Verifica se o usuário está autenticado.
  bool isAuthenticated() {
    return _checkAuthenticationStatusUseCase();
  }
}
