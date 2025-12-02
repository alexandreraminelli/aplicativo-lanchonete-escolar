import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gosnack_client/features/onboarding/screens/onboarding.dart';

/// Repositório de autenticação do Firebase.
/// Responsável por gerenciar o login, logout e estado de autenticação do usuário.
class AuthenticationRepository extends GetxController {
  /// Instância singleton do repositório.
  static AuthenticationRepository get instance => Get.find();

  // -- Variables ----------------------------------------------------------- //

  /// Armazenamento local do dispositivo para garantir persistência de dados.
  /// Utiliza o pacote GetStorage.
  final deviceStorage = GetStorage();

  /// Instância do Firebase Authentication.
  /// Usado para efetuar operações de autenticação no Firebase.
  final _auth = FirebaseAuth.instance;

  /// Getter para obter dados do usuário autenticado no app.
  /// Retorna `null` se nenhum usuário estiver autenticado.
  User? get authUser => _auth.currentUser;

  // -- Inicialização ------------------------------------------------------- //

  /// Chamado quando o Authentication Repository é inicializado.
  /// 1. Remove a Splash Screen;
  /// 2. Redireciona para a tela apropriada com base no estado de autenticação.
  @override
  void onReady() {
    super.onReady();
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Redireciona para a tela relevante com base no estado de autenticação:
  /// - **Primeira vez no app:** tela de boas-vindas (Onboarding).
  /// - **Usuário não autenticado:** tela de login.
  /// - **Usuário autenticado**:
  ///   - **E-mail não verificado:** tela de verificação de e-mail.
  ///   - **E-mail verificado:** tela inicial do app.
  Future<void> screenRedirect() async {
    // TODO: implementar lógica de redirecionamento
    Get.offAll(() => const OnBoardingScreen());
  }
}
