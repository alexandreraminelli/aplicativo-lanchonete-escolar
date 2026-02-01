import 'package:gosnack_client/features/unit_cafeteria_selection/domain/interfaces/unit_cafeteria_repository.dart';

/// Use Case para salvar a unidade e lanchonete selecionadas.
class SelectUnitAndCafeteriaUseCase {
  // -- Instance Variables -------------------------------------------------- //

  /// Repositório .
  final UnitCafeteriaRepository _repository;

  // -- Public Constructor -------------------------------------------------- //

  SelectUnitAndCafeteriaUseCase(this._repository);

  // -- Public Methods ------------------------------------------------------ //

  /// Executa o Use Case para salvar localmente os IDs da unidade e
  /// lanchonete selecionadas.
  Future<void> call({
    required String unitId,
    required String cafeteriaId,
  }) async {
    await _repository.saveSelection(unitId: unitId, cafeteriaId: cafeteriaId);
  }
}
