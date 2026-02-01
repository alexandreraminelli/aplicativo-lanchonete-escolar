import 'package:gosnack_client/features/unit_cafeteria_selection/domain/entities/cafeteria_entity.dart';
import 'package:gosnack_client/features/unit_cafeteria_selection/domain/interfaces/unit_cafeteria_repository.dart';

/// Use Case para obter todas as lanchonetes de uma unidade escolar específica
/// no repositório.
class GetCafeteriasByUnitUseCase {
  // -- Instance Variables -------------------------------------------------- //

  final UnitCafeteriaRepository _repository;

  // -- Public Constructor -------------------------------------------------- //

  GetCafeteriasByUnitUseCase(this._repository);

  // -- Public Methods ------------------------------------------------------ //

  /// Executa o Use Case para obter todas as lanchonetes de uma unidade
  /// escolar específica.
  Future<List<CafeteriaEntity>> call(String unitId) {
    return _repository.getCafeteriasByUnitId(unitId);
  }
}
