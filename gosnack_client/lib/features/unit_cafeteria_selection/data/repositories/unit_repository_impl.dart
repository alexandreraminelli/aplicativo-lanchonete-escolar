import 'package:gosnack_client/features/unit_cafeteria_selection/data/datasources/firestore/unit_firestore_datasource.dart';
import 'package:gosnack_client/features/unit_cafeteria_selection/data/mappers/unit_mapper.dart';
import 'package:gosnack_client/features/unit_cafeteria_selection/domain/entities/unit_entity.dart';
import 'package:gosnack_client/features/unit_cafeteria_selection/domain/interfaces/unit_repository.dart';

/// Implementação de serviço do repositório de unidades.
class UnitRepositoryImpl implements UnitRepository {
  // -- Instance Variables -------------------------------------------------- //

  /// Data source do Firestore.
  final UnitFirestoreDataSource datasource;

  // -- Public Constructor -------------------------------------------------- //

  UnitRepositoryImpl(this.datasource);

  // -- Public Override Methods ---------------------------------------------- //

  @override
  Future<List<UnitEntity>> getAllUnits() async {
    // Obter todas as unidades do data source
    final models = await datasource.getAllUnits();
    // Mapear para entidades
    return models.map(UnitMapper.toEntity).toList();
  }
}
