import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:gosnack_client/common/widgets/inputs/dropdown_menu.dart';
import 'package:gosnack_client/features/unit_cafeteria_selection/domain/entities/cafeteria.dart';
import 'package:gosnack_client/features/unit_cafeteria_selection/domain/entities/unit.dart';
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

    // -- Widget principal
    return Obx(() {
      if (controller.isLoadingUnits.value) {
        return loading; // Loading
      }

      // -- Formulário
      return Form(
        child: Column(
          spacing: KSizes.spacingBtwFields,
          children: [
            // -- Dropdown de unidades
            AppDropdownMenu<Unit>(
              label: 'Unidade', // TODO: usar constante de texto
              // Lista de unidades
              dropdownMenuEntries: controller.units
                  .map(
                    (unit) => DropdownMenuEntry(value: unit, label: unit.name),
                  )
                  .toList(),
              // Callback ao selecionar
              onSelected: (unit) {
                if (unit != null) {
                  controller.selectUnit(unit);
                }
              },
            ),

            // -- Dropdown de lanchonetes
            AppDropdownMenu<Cafeteria>(
              label: 'Lanchonete', // TODO: usar constante de texto
              // Desabilitar se nenhuma unidade selecionada ou está carregando
              enabled:
                  controller.selectedUnit.value != null &&
                  !controller.isLoadingCafeterias.value,
              // Lista de lanchonetes
              dropdownMenuEntries: controller.cafeterias
                  .map(
                    (cafeteria) => DropdownMenuEntry(
                      value: cafeteria,
                      label: cafeteria.name,
                    ),
                  )
                  .toList(),
              // Callback ao selecionar
              onSelected: (cafeteria) {
                if (cafeteria != null) {
                  controller.selectCafeteria(cafeteria);
                }
              },
            ),
          ],
        ),
      );
    });
  }
}
