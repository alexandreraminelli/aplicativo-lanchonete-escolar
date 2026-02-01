import 'package:gosnack_client/features/unit_cafeteria_selection/domain/entities/cafeteria_entity.dart';
import 'package:gosnack_client/features/unit_cafeteria_selection/domain/interfaces/unit_cafeteria_repository.dart';

/// Use Case para obter todas as lanchonetes de uma unidade escolar específica
/// no repositório.
class GetCafeteriasByUnitUseCase {
  // -- Public Constructor -------------------------------------------------- //
  GetCafeteriasByUnitUseCase(this.repository);

  // -- Instance Variables -------------------------------------------------- //

  final UnitCafeteriaRepository repository;

  // -- Public Methods ------------------------------------------------------ //

  /// Executa o Use Case para obter todas as lanchonetes de uma unidade
  /// escolar específica.
  Future<List<CafeteriaEntity>> call(String unitId) {
    return repository.getCafeteriasByUnitId(unitId);
  }
}
