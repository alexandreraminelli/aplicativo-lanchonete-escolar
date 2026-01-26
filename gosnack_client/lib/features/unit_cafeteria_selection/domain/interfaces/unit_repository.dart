import 'package:gosnack_client/features/unit_cafeteria_selection/domain/entities/unit.dart';

/// Interface com as funcionalidades e interações relacionadas às unidades escolares.
abstract class UnitRepository {
  /// Obter uma lista de todas as unidades escolares.
  Future<List<Unit>> getAllUnits();
}
