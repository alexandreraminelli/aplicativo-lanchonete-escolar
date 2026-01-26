/// Entidade que representa uma unidade escolar.
class Unit {
  // -- Public Constructor -------------------------------------------------- //
  const Unit({required this.id, required this.name});

  // -- Public Instance Variables ------------------------------------------- //

  /// ID da unidade no Firestore.
  final String id;

  /// Nome da unidade escolar.
  final String name;
}
