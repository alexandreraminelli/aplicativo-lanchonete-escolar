import 'package:gosnack_client/features/unit_cafeteria_selection/domain/entities/unit_entity.dart';
import 'package:gosnack_client/utils/constants/firestore/fields/unit_fields.dart';

/// Modelo de dados que representa uma unidade escolar.
///
/// Estende [UnitEntity] para incluir métodos de conversão.
class UnitModel extends UnitEntity {
  // -- Public Constructor -------------------------------------------------- //

  const UnitModel({required super.id, required super.name});

  // -- Named Constructors -------------------------------------------------- //

  /// Converte os dados do Firestore em uma instância de [UnitModel].
  factory UnitModel.fromFirestore(Map<String, dynamic> data, String id) {
    return UnitModel(id: id, name: data[UnitFields.name] ?? '');
  }
}
