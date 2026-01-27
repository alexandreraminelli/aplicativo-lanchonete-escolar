import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:gosnack_client/common/widgets/inputs/dropdown_menu.dart';
import 'package:gosnack_client/features/unit_cafeteria_selection/presentation/controllers/unit_cafeteria_selection_controller.dart';
import 'package:gosnack_client/utils/constants/styles/sizes.dart';

/// Widget com formulário para selecionar a unidade e lanchonete.
class UnitCafeteriaSelector extends GetView<UnitCafeteriaSelectionController> {
  // -- Public Constructor -------------------------------------------------- //

  const UnitCafeteriaSelector({super.key});

  // -- Build Method -------------------------------------------------------- //
  @override
  Widget build(BuildContext context) {
    // -- Loading Widget
    // TODO: criar skeleton
    const loading = Center(child: CircularProgressIndicator());

    // -- Unit Dropdown
    const unitDropdown = AppDropdownMenu(
      label: 'Unidade', // TODO: usar constante de texto
      dropdownMenuEntries: [
        DropdownMenuEntry(value: 'unit1', label: 'Unidade 1'),
        DropdownMenuEntry(value: 'unit2', label: 'Unidade 2'),
        DropdownMenuEntry(value: 'unit3', label: 'Unidade 3'),
        DropdownMenuEntry(value: 'unit4', label: 'Unidade 4'),
      ],
    );

    // -- Cafeteria Dropdown
    const cafeteriaDropdown = AppDropdownMenu(
      label: 'Lanchonete', // TODO: usar constante de texto
      enabled: false,
      dropdownMenuEntries: [
        DropdownMenuEntry(value: "snackbar1", label: "Lanchonete 1"),
        DropdownMenuEntry(value: "snackbar2", label: "Lanchonete 2"),
        DropdownMenuEntry(value: "snackbar3", label: "Lanchonete 3"),
      ],
    );

    // -- Formulário com os dropdowns
    const form = Form(
      child: Column(
        spacing: KSizes.spacingBtwFields,
        children: [unitDropdown, cafeteriaDropdown],
      ),
    );

    // -- Widget principal
    return Obx(() {
      if (controller.isLoadingUnits.value) {
        return loading; // Loading
      } else {
        return form; // Formulário
      }
    });
  }
}
