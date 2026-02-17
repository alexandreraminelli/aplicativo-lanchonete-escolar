import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:gosnack_client/core/logging/logger.dart';
import 'package:gosnack_client/core/routing/routes.dart';
import 'package:gosnack_client/features/authentication/domain/use_cases/check_authentication_status_usecase.dart';
import 'package:gosnack_client/features/authentication/domain/use_cases/get_current_user_usecase.dart';
import 'package:gosnack_client/features/authentication/domain/use_cases/reload_current_user_usecase.dart';
import 'package:gosnack_client/features/authentication/domain/use_cases/screen_redirect_usecase.dart';
import 'package:gosnack_client/features/authentication/domain/use_cases/signout_usecase.dart';

/// Controlador responsável por gerenciar o estado de autenticação na
/// camada de apresentação.
class AuthController extends GetxController {
  // -- Use Cases ----------------------------------------------------------- //

  final ScreenRedirectUseCase _screenRedirectUseCase;
  final LogoutUseCase _logoutUseCase;
  final CheckAuthenticationStatusUsecase _checkAuthenticationStatusUseCase;
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final ReloadCurrentUserUseCase _reloadCurrentUserUseCase;

  // -- Public Constructor -------------------------------------------------- //

  AuthController(
    this._screenRedirectUseCase,
    this._logoutUseCase,
    this._checkAuthenticationStatusUseCase,
    this._getCurrentUserUseCase,
    this._reloadCurrentUserUseCase,
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
      LoggerHelp.error('Erro ao redirecionar tela: $e');
      await Get.offAllNamed(KRoutes.signin);
    }
  }

  /// Obtém o usuário autenticado atualmente, ou null se não houver nenhum.
  Future<User?> getCurrentUser() async {
    try {
      return await _getCurrentUserUseCase();
    } catch (e) {
      LoggerHelp.error('Erro ao obter usuário atual: $e');
      return null;
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

  /// Recarregar os dados do usuário autenticado do Firebase Auth
  /// para obter informações atualizadas.
  Future<void> reloadCurrentUser() async {
    try {
      await _reloadCurrentUserUseCase();
    } catch (e) {
      LoggerHelp.error('Erro ao recarregar usuário atual: $e');
    }
  }
}
