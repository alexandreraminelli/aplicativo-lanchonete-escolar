import 'package:gosnack_client/features/unit_cafeteria_selection/domain/entities/cafeteria.dart';

/// Interface com as funcionalidades e interações relacionadas às lanchonetes.
abstract class CafeteriaRepository {
  /// Obter uma lista de todas as lanchonetes de uma unidade escolar específica.
  Future<List<Cafeteria>> getCafeteriasByUnitId(String unitId);

  /// Obter uma lanchonete específica pelo ID da unidade e da lanchonete.
  Future<Cafeteria?> getCafeteriaById(String unitId, String cafeteriaId);
}
