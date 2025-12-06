import 'package:flutter/material.dart';
import 'package:gosnack_client/utils/constants/styles/colors.dart';
import 'package:gosnack_client/utils/constants/styles/shape.dart';
import 'package:gosnack_client/utils/constants/styles/sizes.dart';
import 'package:gosnack_client/utils/theme/widgets_theme/inputs/input_decoration_theme.dart';

/// Tema do DropdownMenu da aplicação.
class AppDropdownMenuTheme {
  AppDropdownMenuTheme._(); // evitar instanciação

  /// Tema base do MenuStyle do DropdownMenu.
  static MenuStyle _baseMenuStyle(
    BuildContext? context, {
    required Color background,
    required Color foreground,
  }) => MenuStyle(
    // Cores
    backgroundColor: WidgetStatePropertyAll(background),
    // Cantos arredondados
    shape: WidgetStatePropertyAll(KShape.borderRadiusLg),

    // Espaço entre o campo e o menu
    alignment: const AlignmentDirectional(
      -1.0, // corrigir alinhamento horizontal
      1.25, // espaço vertical de 12px
    ),
    // Limitar width máxima
    maximumSize: WidgetStatePropertyAll(
      Size(
        // max-width calculada de acordo com o tamanho da tela
        ((context != null)
            ? (MediaQuery.of(context).size.width -
                  KSizes.horizontalScreenPadding * 2)
            : KSizes.xl7),
        double.infinity, // height livre
      ),
    ),
  );

  /// Tema do MenuStyle no modo claro.
  static MenuStyle lightMenuStyle(BuildContext? context) => _baseMenuStyle(
    context,
    background: KColors.content1light,
    foreground: KColors.content1dark,
  );

  /// Tema do MenuStyle no modo escuro.
  static MenuStyle darkMenuStyle(BuildContext? context) => _baseMenuStyle(
    context,
    background: KColors.content1dark,
    foreground: KColors.content1light,
  );

  /// Tema base do DropdownMenuTheme com propriedades compartilhadas no modo claro e escuro.
  static DropdownMenuThemeData _base({
    required InputDecorationThemeData inputDecorationTheme,
    required MenuStyle menuStyle,
  }) => DropdownMenuThemeData(
    inputDecorationTheme: inputDecorationTheme,
    menuStyle: menuStyle,
  );

  /// Tema do DropdownMenu no modo claro.
  static final DropdownMenuThemeData light = _base(
    inputDecorationTheme: AppInputDecorationTheme.light,
    menuStyle: lightMenuStyle(null),
  );

  /// Tema do DropdownMenu no modo escuro.
  static final DropdownMenuThemeData dark = _base(
    inputDecorationTheme: AppInputDecorationTheme.dark,
    menuStyle: darkMenuStyle(null),
  );
}
