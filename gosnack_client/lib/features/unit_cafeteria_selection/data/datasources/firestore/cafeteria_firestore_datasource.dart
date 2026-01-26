import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gosnack_client/features/unit_cafeteria_selection/data/models/cafeteria_model.dart';
import 'package:gosnack_client/utils/constants/firestore/collections.dart';
import 'package:gosnack_client/utils/constants/firestore/fields/cafeteria_fields.dart';

/// Data Source da coleção de cafeterias no Firestore.
class CafeteriaFirestoreDataSource {
  // -- Instance Variables -------------------------------------------------- //

  /// Instância do Firestore.
  final FirebaseFirestore _db;

  // -- Public Constructor -------------------------------------------------- //

  CafeteriaFirestoreDataSource(this._db);

  // -- Public Methods ------------------------------------------------------ //

  /// Obter todos os documentos da subcoleção de cafeterias de uma unidade.
  Future<List<CafeteriaModel>> getAllCafeteriasByUnit(String unitId) async {
    // Realizar consulta no Firestore
    final snapshot = await _db
        .collection(FirestoreCollections.units)
        .doc(unitId)
        .collection(FirestoreCollections.cafeterias)
        .orderBy(CafeteriaFields.name)
        .get();

    // Mapear documentos para modelos
    return snapshot.docs
        .map((doc) => CafeteriaModel.fromFirestore(doc.data(), doc.id))
        .toList();
  }
}
