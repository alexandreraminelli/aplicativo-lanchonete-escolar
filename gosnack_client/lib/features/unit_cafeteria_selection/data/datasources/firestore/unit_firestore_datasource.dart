import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gosnack_client/features/unit_cafeteria_selection/data/models/unit_model.dart';
import 'package:gosnack_client/utils/constants/firestore/collections.dart';
import 'package:gosnack_client/utils/constants/firestore/fields/unit_fields.dart';

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
    // Realizar consulta ao Firestore
    final snapshot = await _db
        .collection(FirestoreCollections.units)
        .orderBy(UnitFields.name)
        .get();

    // Mapear documentos para modelos
    return snapshot.docs
        .map((doc) => UnitModel.fromFirestore(doc.data(), doc.id))
        .toList();
  }
}
