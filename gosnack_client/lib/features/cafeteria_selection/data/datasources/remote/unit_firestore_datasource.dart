import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gosnack_client/features/cafeteria_selection/data/models/unit_model.dart';
import 'package:gosnack_client/core/config/firestore/collections.dart';
import 'package:gosnack_client/core/config/firestore/fields/unit_fields.dart';

/// Data Source da coleção de unidades escolares no Firestore.
class UnitFirestoreDataSource {
  // -- Instance Variables -------------------------------------------------- //

  /// Instância do Firestore.
  final FirebaseFirestore _db;

  // -- Public Constructor -------------------------------------------------- //

  UnitFirestoreDataSource(this._db);

  // -- Public Methods ------------------------------------------------------ //

  /// Obter todos os documentos da coleção de unidades escolares.
  Future<List<UnitModel>> getAllUnits() async {
    // Realizar consulta no Firestore
    final snapshot = await _db
        .collection(FirestoreCollections.units)
        .orderBy(UnitFields.name)
        .get();

    // Mapear documentos para modelos
    return snapshot.docs
        .map((doc) => UnitModel.fromFirestore(doc.data(), doc.id))
        .toList();
  }

  /// Obtêm uma unidade escolar pelo seu ID.
  Future<UnitModel?> getUnitById(String unitId) async {
    // Realizar consulta no Firestore
    final doc = await _db
        .collection(FirestoreCollections.units)
        .doc(unitId)
        .get();
    // Verificar se o documento existe
    if (!doc.exists) return null;
    // Mapear documento para modelo
    return UnitModel.fromFirestore(doc.data()!, doc.id);
  }
}
