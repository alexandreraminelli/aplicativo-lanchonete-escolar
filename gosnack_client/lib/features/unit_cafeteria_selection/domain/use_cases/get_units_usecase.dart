import 'package:gosnack_client/features/unit_cafeteria_selection/domain/entities/unit_entity.dart';
import 'package:gosnack_client/features/unit_cafeteria_selection/domain/interfaces/unit_cafeteria_repository.dart';

/// Use Case para obter todas as unidades escolares do repositório.
class GetUnitsUseCase {
  // -- Public Constructor -------------------------------------------------- //
  GetUnitsUseCase(this.repository);

  // -- Instance Variables -------------------------------------------------- //

  final UnitCafeteriaRepository repository;

  // -- Public Methods ------------------------------------------------------ //

  /// Executa o Use Case para obter todas as unidades escolares.
  Future<List<UnitEntity>> call() {
    return repository.getAllUnits();
  }
}
