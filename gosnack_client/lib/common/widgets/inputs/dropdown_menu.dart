import 'package:flutter/material.dart';
import 'package:gosnack_client/utils/constants/content/icons.dart';
import 'package:gosnack_client/utils/constants/styles/sizes.dart';
import 'package:gosnack_client/utils/helpers/helper_functions.dart';
import 'package:hugeicons/hugeicons.dart';

/// Widget personalizado para o Dropdown Menu.
class AppDropdownMenu<T> extends StatelessWidget {
  // -- Public Constructor -------------------------------------------------- //
  const AppDropdownMenu({
    required this.dropdownMenuEntries,
    required this.label,
    this.enabled = true,
    super.key,
  });

  // -- Public Instance Variables ------------------------------------------- //

  /// Lista de itens DropdownMenuEntry.
  final List<DropdownMenuEntry<T>> dropdownMenuEntries;

  /// Se o Dropdown Menu está habilitado.
  final bool enabled;

  /// Rótulo do Dropdown Menu.
  final String label;

  // -- Build Method -------------------------------------------------------- //
  @override
  Widget build(BuildContext context) {
    // -- Usar context para calcular a largura
    // obter estilo do menu
    final themeMenuStyle = Theme.of(context).dropdownMenuTheme.menuStyle;
    final customMenuStyle = themeMenuStyle?.copyWith(
      maximumSize: WidgetStatePropertyAll(
        Size(
          // max-width: subtrair padding padrão da tela
          HelperFunctions.screenWidth(context) -
              (KSizes.horizontalScreenPadding * 2),
          double.infinity, // height livre
        ),
      ),
    );

    // -- Widget principal
    return DropdownMenu(
      // Passar context para calcular a width do menu
      menuStyle: customMenuStyle,

      label: Text(label), // rótulo
      width: double.infinity, // largura total

      enabled: enabled, // se está habilitado
      // -- Itens do menu
      dropdownMenuEntries: dropdownMenuEntries,

      // -- Ícones de setas
      trailingIcon: const HugeIcon(
        // aberto
        icon: KIcons.arrowDown,
      ),
      selectedTrailingIcon: const HugeIcon(
        // fechado
        icon: KIcons.arrowUp,
      ),
    );
  }
}
