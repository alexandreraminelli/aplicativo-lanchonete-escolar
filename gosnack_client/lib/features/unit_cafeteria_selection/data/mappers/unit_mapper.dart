import 'package:gosnack_client/features/unit_cafeteria_selection/data/models/unit_model.dart';
import 'package:gosnack_client/features/unit_cafeteria_selection/domain/entities/unit.dart';

/// Utilitário para converter modelo de domínio [Unit] para modelo de
/// dados [UnitModel] e vice-versa.
class UnitMapper {
  /// Converte um modelo de dados [UnitModel] em um modelo de domínio [Unit].
  static Unit toEntity(UnitModel model) {
    return Unit(id: model.id, name: model.name);
  }
}
