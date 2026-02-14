/// Entidade que representa uma unidade escolar.
class UnitEntity {
  // -- Public Instance Variables ------------------------------------------- //

  /// ID da unidade no Firestore.
  final String id;

  /// Nome da unidade escolar.
  final String name;

  // -- Public Constructor -------------------------------------------------- //
  const UnitEntity({required this.id, required this.name});
}
