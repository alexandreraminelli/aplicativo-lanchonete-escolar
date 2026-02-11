import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';

/// Utilitário para gerenciar o status de conectividade da rede.
/// Fornece métodos para verificar e lidar com mudanças de conectividade.
class NetworkManager extends GetxController {
  /// Instância singleton do NetworkManager.
  static NetworkManager get instance => Get.find();

  // -- Private Instances Variables ----------------------------------------- //

  /// Instância do `connectivity_plus` para monitorar o status da rede.
  final Connectivity _connectivity = Connectivity();

  /// Assinatura para ouvir mudanças na conectividade.
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  /// Lista reativa que mantém o histórico dos status de conectividade.
  final RxList<ConnectivityResult> _connectionStatus =
      <ConnectivityResult>[].obs;

  // -- Lifecycle Methods --------------------------------------------------- //

  // Iniciar monitoramento da conectividade
  @override
  void onInit() {
    super.onInit();
    _initializeConnectivityListener();
  }

  // Cancela a assinatura de monitoramento de conectividade.
  @override
  void onClose() {
    _connectivitySubscription.cancel();
    super.onClose();
  }

  // -- Getters ------------------------------------------------------------- //

  /// Obtém o status atual de conectividade.
  List<ConnectivityResult> get connectionStatus => _connectionStatus;

  /// Verifica se está offiline.
  bool get isOffline => _connectionStatus.contains(ConnectivityResult.none);

  ///Verifica se está online.
  bool get isOnline => !isOffline;

  // -- Private Methods ----------------------------------------------------- //

  /// Inicializa o listener para mudanças de conectividade.
  void _initializeConnectivityListener() {
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      _updateConnectionStatus,
    );
  }

  /// Atualiza o status de conectividade.
  void _updateConnectionStatus(List<ConnectivityResult> result) {
    _connectionStatus.value = result;
  }

  /// -- Public Methods ----------------------------------------------------- //

  /// Verifica se o dispositivo está conectado à internet.
  ///
  /// Retorna `true` se estiver conectado, `false` caso contrário.
  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      return !result.contains(ConnectivityResult.none);
    } on PlatformException catch (_) {
      return false;
    }
  }
}
