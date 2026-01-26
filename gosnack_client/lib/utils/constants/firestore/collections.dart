/// Nomes das coleções raiz do Firestore.
abstract class FirestoreCollections {
  // -- Root Collections ---------------------------------------------------- //

  /// Coleção de categorias.
  static const String categories = 'categories';

  /// Coleção de ingredientes.
  static const String ingredients = 'ingredients';

  /// Coleção de pedidos.
  static const String orders = 'orders';

  /// Coleção de unidades escolares.
  static const String units = 'units';

  /// Coleção de dados dos usuários.
  static const String users = 'users';

  // -- Subcollections ------------------------------------------------------ //

  /// Subcoleção de lanchonetes dentro de uma unidade.
  static const String cafeterias = 'cafeterias';

  /// Subcoleção de produtos dentro de uma lanchonete.
  static const String products = 'products';
}
