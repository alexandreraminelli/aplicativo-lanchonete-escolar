import 'package:gosnack_client/features/cafeteria_selection/domain/entities/cafeteria_entity.dart';
import 'package:gosnack_client/core/config/firestore/fields/cafeteria_fields.dart';

/// Modelo de dados que representa uma lanchonete.
///
/// Estende [CafeteriaEntity] para incluir métodos de conversão.
class CafeteriaModel extends CafeteriaEntity {
  // -- Public Constructor -------------------------------------------------- //

  const CafeteriaModel({
    required super.id,
    required super.name,
    required super.location,
    super.phones = const [],
  });

  // -- Named Constructors -------------------------------------------------- //

  /// Converte os dados do Firestore em uma instância de [CafeteriaModel].
  factory CafeteriaModel.fromFirestore(Map<String, dynamic> data, String id) {
    return CafeteriaModel(
      id: id,
      name: data[CafeteriaFields.name] ?? '',
      location: data[CafeteriaFields.location] ?? '',
      phones: List<String>.from(data[CafeteriaFields.phones] ?? []),
    );
  }
}
