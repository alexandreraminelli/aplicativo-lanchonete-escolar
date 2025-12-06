import 'package:flutter/material.dart';
import 'package:gosnack_client/utils/helpers/helper_functions.dart';
import 'package:gosnack_client/utils/theme/widgets_theme/inputs/dropdown_menu_theme.dart';
import 'package:hugeicons/hugeicons.dart';

/// Widget personalizado para o Dropdown Menu.
class AppDropdownMenu<T> extends StatelessWidget {
  // -- Public Constructor -------------------------------------------------- //
  const AppDropdownMenu({
    required this.dropdownMenuEntries,
    required this.label,
    super.key,
  });

  // -- Public Instance Variables ------------------------------------------- //

  /// Lista de itens DropdownMenuEntry.
  final List<DropdownMenuEntry<T>> dropdownMenuEntries;

  /// Rótulo do Dropdown Menu.
  final String label;

  // -- Build Method -------------------------------------------------------- //
  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);

    // -- Widget principal
    return DropdownMenu(
      // Passar context para calcular a width do menu
      menuStyle: isDark
          ? AppDropdownMenuTheme.darkMenuStyle(context)
          : AppDropdownMenuTheme.lightMenuStyle(context),

      label: Text(label), // rótulo
      width: double.infinity, // largura total
      // -- Itens do menu
      dropdownMenuEntries: dropdownMenuEntries,

      // -- Ícones de setas
      trailingIcon: const HugeIcon(
        // aberto
        icon: HugeIcons.strokeRoundedArrowDown01,
      ),
      selectedTrailingIcon: const HugeIcon(
        // fechado
        icon: HugeIcons.strokeRoundedArrowUp01,
      ),
    );
  }
}
