import 'package:gosnack_client/features/unit_cafeteria_selection/domain/entities/cafeteria.dart';
import 'package:gosnack_client/features/unit_cafeteria_selection/domain/interfaces/cafeteria_repository.dart';

/// Use Case para obter todas as lanchonetes de uma unidade escolar específica
/// no repositório.
class GetCafeteriasByUnitUseCase {
  // -- Public Constructor -------------------------------------------------- //
  GetCafeteriasByUnitUseCase(this.repository);

  // -- Instance Variables -------------------------------------------------- //

  /// Repositório de lanchonetes.
  final CafeteriaRepository repository;

  // -- Public Methods ------------------------------------------------------ //

  /// Executa o Use Case para obter todas as lanchonetes de uma unidade
  /// escolar específica.
  Future<List<Cafeteria>> call(String unitId) {
    return repository.getCafeteriasByUnitId(unitId);
  }
}
