import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';
import 'package:get_storage/get_storage.dart';

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
}
