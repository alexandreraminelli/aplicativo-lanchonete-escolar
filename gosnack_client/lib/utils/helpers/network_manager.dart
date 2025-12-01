import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:gosnack_client/utils/popups/toasts.dart';

/// Utilitário para gerenciar o status de conectividade da rede.
/// Fornece métodos para verificar e lidar com mudanças de conectividade.
class NetworkManager extends GetxController {
  // -- Instância Singleton
  static NetworkManager get instance => Get.find();

  // -- Private Instances Variables ----------------------------------------- //

  /// Instância do `connectivity_plus` para monitorar o status da rede.
  final Connectivity _connectivity = Connectivity();

  /// Assinatura para ouvir mudanças na conectividade.
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  /// Lista reativa que mantém o histórico dos status de conectividade.
  final RxList<ConnectivityResult> _connectionStatus =
      <ConnectivityResult>[].obs;

  // -- Public Override Methods --------------------------------------------- //

  // Iniciar monitoramento de conectividade
  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      _updateConnectionStatus,
    );
  }

  // Cancelar assinatura da conectividade ativa.
  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }

  /// -- Private Methods ---------------------------------------------------- //

  /// Atualiza o status de conectividade com base nos resultados fornecidos.
  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    _connectionStatus.value = result;
    if (result.contains(ConnectivityResult.none)) {
      // Se não houver conexão: mensagem de aviso
      // TODO: substituir por toast de error
      AppToasts.customToast(Get.context!, message: "No Internet Connection");
    }
  }

  /// -- Public Methods ----------------------------------------------------- //

  /// Verifica se o dispositivo está conectado à internet.
  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      if (result.any((element) => element == ConnectivityResult.none)) {
        return false; // Sem conexão
      } else {
        return true; // Com conexão
      }
    } on PlatformException catch (_) {
      return false;
    }
  }
}
