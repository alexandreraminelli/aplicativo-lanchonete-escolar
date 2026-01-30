/// Entidade que representa uma lanchonete.
class CafeteriaEntity {
  // -- Public Instance Variables ------------------------------------------- //

  /// ID da lanchonete no Firestore.
  final String id;

  /// Nome da lanchonete.
  final String name;

  /// Localização da lanchonete dentro da escola.
  final String location;

  /// Telefones de contato da lanchonete.
  final List<String> phones;

  /// TODO: Horários de funcionamento da lanchonete.

  // -- Public Constructor -------------------------------------------------- //
  const CafeteriaEntity({
    required this.id,
    required this.name,
    required this.location,
    this.phones = const [],
  });
}
