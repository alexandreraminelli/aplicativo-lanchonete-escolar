import 'package:get/get.dart';
import 'package:gosnack_client/features/unit_cafeteria_selection/domain/entities/cafeteria_entity.dart';
import 'package:gosnack_client/features/unit_cafeteria_selection/domain/entities/unit_entity.dart';
import 'package:gosnack_client/features/unit_cafeteria_selection/domain/use_cases/get_cafeterias_by_unit_usecase.dart';
import 'package:gosnack_client/features/unit_cafeteria_selection/domain/use_cases/get_units_usecase.dart';
import 'package:gosnack_client/features/unit_cafeteria_selection/domain/use_cases/select_unit_and_cafeteria_usecase.dart';
import 'package:gosnack_client/utils/logging/logger.dart';

/// Controlador de estado para seleção de unidade e lanchonete.
class UnitCafeteriaSelectionController extends GetxController {
  // -- Use Cases Variables ------------------------------------------------- //

  final GetUnitsUseCase _getUnits;
  final GetCafeteriasByUnitUseCase _getCafeteriasByUnit;
  final SelectUnitAndCafeteriaUseCase _selectUnitAndCafeteriaUseCase;

  // -- Public Constructor -------------------------------------------------- //

  UnitCafeteriaSelectionController(
    this._getUnits,
    this._getCafeteriasByUnit,
    this._selectUnitAndCafeteriaUseCase,
  );

  // -- State Variables ----------------------------------------------------- //

  // -- Listas Observáveis
  final RxList<UnitEntity> units = <UnitEntity>[].obs;
  final RxList<CafeteriaEntity> cafeterias = <CafeteriaEntity>[].obs;

  // -- Entidades selecionadas
  final Rx<UnitEntity?> selectedUnit = Rx<UnitEntity?>(null);
  final Rx<CafeteriaEntity?> selectedCafeteria = Rx<CafeteriaEntity?>(null);

  // -- Status de carregamento
  final RxBool isLoadingUnits = false.obs;
  final RxBool isLoadingCafeterias = false.obs;

  // -- Getters ------------------------------------------------------------- //

  /// Verifica se há uma unidade e lanchonete selecionados.
  bool get isSelectionComplete =>
      selectedUnit.value != null && selectedCafeteria.value != null;

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
      units.assignAll(await _getUnits());
    } catch (e) {
      LoggerHelp.error('Erro ao carregar unidades: $e');
    } finally {
      isLoadingUnits.value = false; // sinalizar fim do carregamento
    }
  }

  /// Atualizar unidade selecionada e carregar suas lanchonetes.
  Future<void> selectUnit(UnitEntity unit) async {
    // Atualizar estados
    selectedUnit.value = unit; // Atualizar estado de seleção
    selectedCafeteria.value = null; // Limpar seleção de lanchonete
    cafeterias.clear(); // Limpar lista de lanchonetes

    await loadCafeterias(unit.id); // Carregar lanchonetes da unidade
  }

  /// Atualizar lanchonete selecionada.
  void selectCafeteria(CafeteriaEntity cafeteria) {
    selectedCafeteria.value = cafeteria;
  }

  /// Salva os IDs da unidade e lanchonete selecionadas localmente.
  Future<void> saveSelections() async {
    // Verificar se a seleção está completa
    if (!isSelectionComplete) {
      throw Exception('Seleção de unidade e lanchonete incompleta.');
    } else {
      await _selectUnitAndCafeteriaUseCase.call(
        unitId: selectedUnit.value!.id,
        cafeteriaId: selectedCafeteria.value!.id,
      );
    }
  }

  // -- Private Methods ----------------------------------------------------- //

  /// Carregar lanchonetes associadas a unidade selecionada.
  Future<void> loadCafeterias(String unitId) async {
    try {
      isLoadingCafeterias.value = true; // sinalizar início do carregamento
      cafeterias.assignAll(await _getCafeteriasByUnit(unitId));
    } finally {
      isLoadingCafeterias.value = false; // sinalizar fim do carregamento
    }
  }
}
