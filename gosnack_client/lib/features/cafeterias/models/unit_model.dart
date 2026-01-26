import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gosnack_client/utils/constants/firestore/fields/unit_fields.dart';

/// Modelo de unidades escolares.
class UnitModel {
  // -- Public Constructor -------------------------------------------------- //
  const UnitModel({required this.id, required this.name});

  // -- Named Constructors -------------------------------------------------- //

  /// Cria uma instância de [UnitModel] a partir de um Json Map.
  factory UnitModel.fromJson(
    Map<String, dynamic> document, {
    required String id,
  }) {
    final data = document;
    // Retornar instância
    return UnitModel(id: id, name: data[UnitFields.name] as String? ?? '');
  }

  /// Cria uma instância de [UnitModel] a partir de um DocumentSnapshot do Firestore.
  factory UnitModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();

    // Verificar se os dados não são nulos
    if (data == null) {
      throw StateError('Unit document ${snapshot.id} has no data');
    }
    // Mapear para instância
    return UnitModel(
      id: snapshot.id,
      name: data[UnitFields.name] as String? ?? '',
    );
  }

  // -- Public Instance Variables ------------------------------------------- //

  /// ID da unidade no Firestore.
  final String id;

  /// Nome da unidade escolar.
  final String name;

  // -- Public Methods ------------------------------------------------------ //

  /// Converte a instância de [UnitModel] em um Json Map para salvar no Firestore.
  Map<String, dynamic> toJson() {
    return {UnitFields.name: name};
  }
}
