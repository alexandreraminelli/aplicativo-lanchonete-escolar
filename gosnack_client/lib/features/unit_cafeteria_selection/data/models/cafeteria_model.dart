import 'package:gosnack_client/utils/constants/firestore/fields/cafeteria_fields.dart';

/// Modelo de lanchonetes para mapear dados do Firestore.
class CafeteriaModel {
  // -- Public Variables ---------------------------------------------------- //

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

  const CafeteriaModel({
    required this.id,
    required this.name,
    required this.location,
    this.phones = const [],
  });

  // -- Named Constructors -------------------------------------------------- //

  /// Cria uma instância de [CafeteriaModel] a partir de dados do Firestore.
  factory CafeteriaModel.fromFirestore(Map<String, dynamic> data, String id) {
    return CafeteriaModel(
      id: id,
      name: data[CafeteriaFields.name] ?? '',
      location: data[CafeteriaFields.location] ?? '',
      phones: List<String>.from(data[CafeteriaFields.phones] ?? []),
    );
  }
}
