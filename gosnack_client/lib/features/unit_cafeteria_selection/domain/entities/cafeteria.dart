/// Entidade que representa uma lanchonete.
class Cafeteria {
  // -- Public Constructor -------------------------------------------------- //
  const Cafeteria({
    required this.id,
    required this.name,
    required this.location,
    this.phones = const [],
  });

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
}
