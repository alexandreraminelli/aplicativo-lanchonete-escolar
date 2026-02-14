import 'package:gosnack_client/features/cafeteria_selection/domain/repositories/unit_cafeteria_repository.dart';

/// Use Case para salvar a unidade e lanchonete selecionadas.
class SelectCafeteriaUseCase {
  // -- Instance Variables -------------------------------------------------- //

  final UnitCafeteriaRepository _repository;

  // -- Public Constructor -------------------------------------------------- //

  SelectCafeteriaUseCase(this._repository);

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
