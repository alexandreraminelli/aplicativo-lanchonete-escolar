import 'package:gosnack_client/features/unit_cafeteria_selection/data/models/cafeteria_model.dart';
import 'package:gosnack_client/features/unit_cafeteria_selection/domain/entities/cafeteria.dart';

/// Utilitário para converter modelo de domínio [Cafeteria] para modelo de
/// dados [CafeteriaModel] e vice-versa.
class CafeteriaMapper {
  /// Converter um modelo de dados [CafeteriaModel] em um modelo de domínio [Cafeteria].
  static Cafeteria toEntity(CafeteriaModel model) {
    return Cafeteria(
      id: model.id,
      name: model.name,
      location: model.location,
      phones: model.phones,
    );
  }
}
