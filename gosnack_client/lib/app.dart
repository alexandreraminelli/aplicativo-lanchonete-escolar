import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:gosnack_client/routes/app_routes.dart';
import 'package:gosnack_client/utils/bindings/general_bindings.dart';
import 'package:gosnack_client/utils/constants/styles/colors.dart';
import 'package:gosnack_client/utils/theme/theme.dart';

/// Widget raiz da aplicação.
/// Define temas, rotas e bindings globais.
class App extends StatelessWidget {
  // -- Public Constructor -------------------------------------------------- //
  const App({super.key});

  // -- Private Static Variables -------------------------------------------- //

  /// Tela de carregamento enquanto decide qual tela inicial exibir.
  static const _loadingScreen = Center(
    child: CircularProgressIndicator(color: KColors.primary),
  );

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
      home: const Scaffold(body: _loadingScreen),
    );
  }
}
