import 'package:gosnack_client/features/cafeteria_selection/domain/entities/unit_entity.dart';
import 'package:gosnack_client/features/cafeteria_selection/domain/repositories/unit_cafeteria_repository.dart';

/// Use Case para obter todas as unidades escolares do repositório.
class GetUnitsUseCase {
  // -- Instance Variables -------------------------------------------------- //

  final UnitCafeteriaRepository _repository;

  // -- Public Constructor -------------------------------------------------- //

  GetUnitsUseCase(this._repository);

  // -- Public Methods ------------------------------------------------------ //

  /// Executa o Use Case para obter todas as unidades escolares.
  Future<List<UnitEntity>> call() {
    return _repository.getAllUnits();
  }
}
