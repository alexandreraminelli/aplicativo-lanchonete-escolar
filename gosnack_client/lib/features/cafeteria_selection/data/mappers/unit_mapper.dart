import 'package:gosnack_client/features/cafeteria_selection/data/models/unit_model.dart';
import 'package:gosnack_client/features/cafeteria_selection/domain/entities/unit_entity.dart';

/// Utilitário para converter modelo de domínio [UnitEntity] para modelo de
/// dados [UnitModel] e vice-versa.
class UnitMapper {
  /// Converte um modelo de dados [UnitModel] em um modelo de domínio [UnitEntity].
  static UnitEntity toEntity(UnitModel model) {
    return UnitEntity(id: model.id, name: model.name);
  }
}
