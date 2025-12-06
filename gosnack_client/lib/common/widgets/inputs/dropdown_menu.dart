import 'package:flutter/material.dart';
import 'package:gosnack_client/utils/helpers/helper_functions.dart';
import 'package:gosnack_client/utils/theme/widgets_theme/inputs/dropdown_menu_theme.dart';

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
      label: Text(label), // rótulo
      width: double.infinity, // largura total
      // Passar context para calcular a width do menu
      menuStyle: isDark
          ? AppDropdownMenuTheme.darkMenuStyle(context)
          : AppDropdownMenuTheme.lightMenuStyle(context),
      // Itens do menu
      dropdownMenuEntries: dropdownMenuEntries,
    );
  }
}
