import 'package:gosnack_client/features/cafeteria_selection/domain/entities/cafeteria_entity.dart';
import 'package:gosnack_client/features/cafeteria_selection/domain/entities/unit_entity.dart';

/// Interface com o contrato do repositório de unidades e lanchonetes.
///
/// Define os métodos que devem ser implementados operações relacionadas a unidades e lanchonetes.
abstract class UnitCafeteriaRepository {
  // -- Unit Operations ----------------------------------------------------- //

  /// Obter uma lista de todas as unidades escolares.
  Future<List<UnitEntity>> getAllUnits();

  // -- Cafeteria Operations ------------------------------------------------ //

  /// Obter uma lista de todas as lanchonetes de uma unidade escolar específica.
  Future<List<CafeteriaEntity>> getCafeteriasByUnitId(String unitId);

  /// Obter uma lanchonete específica pelo ID da unidade e da lanchonete.
  Future<CafeteriaEntity?> getCafeteriaById(String unitId, String cafeteriaId);

  // -- Unit & Cafeteria Selection Operations ------------------------------- //

  /// Salva a unidade e lanchonete selecionadas localmente.
  Future<void> saveSelection({
    required String unitId,
    required String cafeteriaId,
  });

  /// Obtém a unidade selecionada.
  Future<UnitEntity?> getSelectedUnit();

  /// Obtém a lanchonete selecionada.
  Future<CafeteriaEntity?> getSelectedCafeteria();

  /// Limpa as seleções locais.
  Future<void> clearSelection();
}
