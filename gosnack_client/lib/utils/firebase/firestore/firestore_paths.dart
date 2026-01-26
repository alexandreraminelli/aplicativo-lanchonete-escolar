import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gosnack_client/utils/constants/firestore/collections.dart';

/// Referências para caminhos de coleções e subcoleções no Firestore.
class FirestorePaths {
  // -- Public Constructor -------------------------------------------------- //
  const FirestorePaths(this._firestore);

  // -- Private Instance Variables ------------------------------------------ //

  /// Instância do Firestore.
  final FirebaseFirestore _firestore;

  // -- Root Collections ---------------------------------------------------- //

  /// Referência para a coleção de categorias no Firestore.
  CollectionReference<Map<String, dynamic>> categories() =>
      _firestore.collection(FirestoreCollections.cafeterias);

  /// Referência para a coleção de ingredientes no Firestore.
  CollectionReference<Map<String, dynamic>> ingredients() =>
      _firestore.collection(FirestoreCollections.ingredients);

  /// Referência para a coleção de pedidos no Firestore.
  CollectionReference<Map<String, dynamic>> orders() =>
      _firestore.collection(FirestoreCollections.orders);

  /// Referência para a coleção de unidades escolares no Firestore.
  CollectionReference<Map<String, dynamic>> units() =>
      _firestore.collection(FirestoreCollections.units);

  /// Referência para a coleção de usuários no Firestore.
  CollectionReference<Map<String, dynamic>> users() =>
      _firestore.collection(FirestoreCollections.users);

  // -- Subcollections ------------------------------------------------------ //

  /// Referência para a subcoleção lanchonetes dentro de uma unidade (`units/{unitId}/cafeterias`) no Firestore.
  CollectionReference<Map<String, dynamic>> cafeterias(String unitId) =>
      _firestore
          .collection(FirestoreCollections.units)
          .doc(unitId)
          .collection(FirestoreCollections.cafeterias);

  /// Referência para a subcoleção produtos dentro de uma lanchonete (`units/{unitId}/cafeterias/{cafeteriaId}/products`) no Firestore.
  CollectionReference<Map<String, dynamic>> products(
    String unitId,
    String cafeteriaId,
  ) => _firestore
      .collection(FirestoreCollections.units)
      .doc(unitId)
      .collection(FirestoreCollections.cafeterias)
      .doc(cafeteriaId)
      .collection(FirestoreCollections.products);
}
