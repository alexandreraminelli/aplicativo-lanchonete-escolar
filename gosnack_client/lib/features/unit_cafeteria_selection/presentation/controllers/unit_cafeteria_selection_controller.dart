import 'package:get/get.dart';
import 'package:gosnack_client/features/unit_cafeteria_selection/domain/entities/cafeteria.dart';
import 'package:gosnack_client/features/unit_cafeteria_selection/domain/entities/unit.dart';
import 'package:gosnack_client/features/unit_cafeteria_selection/domain/use_cases/get_cafeterias_by_unit.dart';
import 'package:gosnack_client/features/unit_cafeteria_selection/domain/use_cases/get_units.dart';

/// Controlador de estado para seleção de unidade e lanchonete.
class UnitCafeteriaSelectionController extends GetxController {
  // -- Use Cases Variables ------------------------------------------------- //

  final GetUnitsUseCase _getUnits;
  final GetCafeteriasByUnitUseCase _getCafeteriasByUnit;

  // -- Public Constructor -------------------------------------------------- //
  UnitCafeteriaSelectionController(this._getUnits, this._getCafeteriasByUnit);

  // -- State Variables ----------------------------------------------------- //

  // -- Listas Observáveis
  final RxList<Unit> units = <Unit>[].obs;
  final RxList<Cafeteria> cafeterias = <Cafeteria>[].obs;

  // -- Entidades selecionadas
  final Rx<Unit?> selectedUnit = Rx<Unit?>(null);
  final Rx<Cafeteria?> selectedCafeteria = Rx<Cafeteria?>(null);

  // -- Status de carregamento
  final RxBool isLoadingUnits = false.obs;
  final RxBool isLoadingCafeterias = false.obs;

  // -- Lifecycle Methods --------------------------------------------------- //

  /// Método chamado quando o controlador é inicializado.
  @override
  void onInit() {
    super.onInit();
    loadUnits(); // carregar unidades ao iniciar
  }

  // -- Public Methods ------------------------------------------------------ //

  /// Carregar todas as unidades escolares.
  Future<void> loadUnits() async {
    try {
      isLoadingUnits.value = true; // sinalizar início do carregamento
      units.value = await _getUnits(); // obter unidades
    } finally {
      isLoadingUnits.value = false; // sinalizar fim do carregamento
    }
  }

  /// Atualizar unidade selecionada e carregar suas lanchonetes.
  Future<void> selectUnit(Unit unit) async {
    // Atualizar estados
    selectedUnit.value = unit; // Atualizar estado de seleção
    selectedCafeteria.value = null; // Limpar seleção de lanchonete
    cafeterias.clear(); // Limpar lista de lanchonetes

    await loadCafeterias(unit.id); // Carregar lanchonetes da unidade
  }

  /// Atualizar lanchonete selecionada.
  void selectCafeteria(Cafeteria cafeteria) {
    selectedCafeteria.value = cafeteria;
  }

  // -- Private Methods ----------------------------------------------------- //

  /// Carregar lanchonetes associadas a unidade selecionada.
  Future<void> loadCafeterias(String unitId) async {
    try {
      isLoadingCafeterias.value = true; // sinalizar início do carregamento
      cafeterias.value = await _getCafeteriasByUnit(unitId);
    } finally {
      isLoadingCafeterias.value = false; // sinalizar fim do carregamento
    }
  }
}
