import 'package:gosnack_client/features/unit_cafeteria_selection/data/models/cafeteria_model.dart';
import 'package:gosnack_client/features/unit_cafeteria_selection/domain/entities/cafeteria_entity.dart';

/// Utilitário para converter modelo de domínio [CafeteriaEntity] para modelo de
/// dados [CafeteriaModel] e vice-versa.
class CafeteriaMapper {
  /// Converter um modelo de dados [CafeteriaModel] em um modelo de domínio [CafeteriaEntity].
  static CafeteriaEntity toEntity(CafeteriaModel model) {
    return CafeteriaEntity(
      id: model.id,
      name: model.name,
      location: model.location,
      phones: model.phones,
    );
  }
}
