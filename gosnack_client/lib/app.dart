import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:gosnack_client/routes/app_routes.dart';
import 'package:gosnack_client/utils/theme/theme.dart';

/// Widget raiz da aplicação.
/// Define temas, rotas e bindings globais.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Tema
      themeMode: ThemeMode.system, // tema padrão: sistema
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,

      // TODO: Bindings gerais da aplicação

      // Rotas
      getPages: AppRoutes.pages,

      // TODO: Tela de carregamento até decidir qual tela mostrar
      home: const Scaffold(body: Center(child: Text('GoSnack'))),
    );
  }
}
