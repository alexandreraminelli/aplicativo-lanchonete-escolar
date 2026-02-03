import 'package:get/get.dart';
import 'package:gosnack_client/features/authentication/presentation/bindings/authentication_bindings.dart';
import 'package:gosnack_client/utils/helpers/network_manager.dart';

/// Bindings gerais da aplicação.
///
/// Define as dependências globais usadas em toda a aplicação que devem ser
/// injetadas durante a inicialização do app.
class GeneralBindings extends Bindings {
  // Definir dependências a serem injetadas globalmente
  @override
  void dependencies() {
    Get.put(NetworkManager()); // Gerenciador de rede

    AuthenticationBinding().dependencies(); // Bindings de autenticação
  }
}
