import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:gosnack_client/app.dart';

/// Ponto de entrada da aplicação.
void main() {
  // Widgets Binding
  // Garante que o Flutter esteja inicializado corretamente antes de executar o app
  final WidgetsBinding widgetsBindings =
      WidgetsFlutterBinding.ensureInitialized();

  // TODO: Iniciar armazenamento local do GetX
  // Garante que o armazenamento local esteja pronto antes de prosseguir

  // Preservar Splash Screen enquanto os demais itens são inicializados
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBindings);

  FlutterNativeSplash.remove(); // TODO: mover para outra classe

  // TODO: Iniciar Firebase

  // Executa a aplicação Flutter
  runApp(const App());
}
