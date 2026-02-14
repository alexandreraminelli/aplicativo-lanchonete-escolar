import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gosnack_client/features/cafeteria_selection/data/models/cafeteria_model.dart';
import 'package:gosnack_client/core/config/firestore/collections.dart';
import 'package:gosnack_client/core/config/firestore/fields/cafeteria_fields.dart';

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

  /// Obter um documento específico da subcoleção de lanchonetes de uma unidade.
  Future<CafeteriaModel?> getCafeteriaById(
    String unitId,
    String cafeteriaId,
  ) async {
    // Realizar consulta no Firestore
    final doc = await _db
        .collection(FirestoreCollections.units)
        .doc(unitId)
        .collection(FirestoreCollections.cafeterias)
        .doc(cafeteriaId)
        .get();

    // Verificar se o documento existe
    if (!doc.exists) return null;
    // Mapear documento para modelo
    return CafeteriaModel.fromFirestore(doc.data()!, doc.id);
  }
}
