import 'package:gosnack_client/features/unit_cafeteria_selection/domain/entities/cafeteria_entity.dart';

/// Interface com as funcionalidades e interações relacionadas às lanchonetes.
abstract class CafeteriaRepository {
  /// Obter uma lista de todas as lanchonetes de uma unidade escolar específica.
  Future<List<CafeteriaEntity>> getCafeteriasByUnitId(String unitId);

  /// Obter uma lanchonete específica pelo ID da unidade e da lanchonete.
  Future<CafeteriaEntity?> getCafeteriaById(String unitId, String cafeteriaId);
}
