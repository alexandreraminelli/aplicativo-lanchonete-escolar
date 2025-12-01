import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gosnack_client/app.dart';

/// Ponto de entrada da aplicação.
void main() async {
  // Widgets Binding
  // Garante que o Flutter esteja inicializado corretamente antes de executar o app
  final WidgetsBinding widgetsBindings =
      WidgetsFlutterBinding.ensureInitialized();

  // Iniciar armazenamento local do GetX
  // Garante que o armazenamento local esteja pronto antes de prosseguir
  await GetStorage.init();

  // Preservar Splash Screen enquanto os demais itens são inicializados
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBindings);

  FlutterNativeSplash.remove(); // TODO: mover para outra classe

  // TODO: Iniciar Firebase

  // Executa a aplicação Flutter
  runApp(const App());
}
