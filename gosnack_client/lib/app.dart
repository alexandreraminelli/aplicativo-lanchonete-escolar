import 'package:flutter/material.dart';

/// Widget raiz da aplicação.
/// Define temas, rotas e bindings globais.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Tema
      themeMode: ThemeMode.system, // tema padrão: sistema
      // TODO: theme: ,
      // TODO: darkTheme: ,

      // TODO: Bindings gerais da aplicação

      // TODO: Rotas

      // TODO: Tela de carregamento até decidir qual tela mostrar
      home: const Scaffold(body: Center(child: Text("GoSnack App"))),
    );
  }
}
