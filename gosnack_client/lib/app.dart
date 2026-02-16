import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:gosnack_client/core/di/app_bindings.dart';
import 'package:gosnack_client/core/routing/app_routes.dart';
import 'package:gosnack_client/core/theme/theme.dart';
import 'package:gosnack_client/core/widgets/feedback/loading/full_screen_loader.dart';

/// Widget raiz da aplicação.
/// Define temas, rotas e bindings globais.
class App extends StatelessWidget {
  // -- Public Constructor -------------------------------------------------- //

  const App({super.key});

  // -- Build Method -------------------------------------------------------- //
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Tema
      themeMode: ThemeMode.system, // tema padrão: sistema
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,

      // Bindings gerais da aplicação
      initialBinding: GeneralBindings(),

      // Rotas
      getPages: AppRoutes.pages,

      // Tela de carregamento até decidir qual tela mostrar
      home: const Scaffold(body: FullScreenLoader()),
    );
  }
}
