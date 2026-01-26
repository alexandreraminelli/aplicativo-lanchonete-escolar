import 'package:gosnack_client/utils/constants/firestore/fields/unit_fields.dart';

/// Modelo de unidades escolares para mapear dados do Firestore.
class UnitModel {
  // -- Public Variables ---------------------------------------------------- //

  /// ID da unidade no Firestore.
  final String id;

  /// Nome da unidade escolar.
  final String name;

  // -- Public Constructor -------------------------------------------------- //

  const UnitModel({required this.id, required this.name});

  // -- Named Constructors -------------------------------------------------- //

  /// Cria uma instância de [UnitModel] a partir de dados do Firestore.
  factory UnitModel.fromFirestore(Map<String, dynamic> data, String id) {
    return UnitModel(id: id, name: data[UnitFields.name] ?? '');
  }
}
