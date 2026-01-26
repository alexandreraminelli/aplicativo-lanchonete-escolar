import 'package:gosnack_client/features/unit_cafeteria_selection/data/datasources/firestore/cafeteria_firestore_datasource.dart';
import 'package:gosnack_client/features/unit_cafeteria_selection/data/mappers/cafeteria_mapper.dart';
import 'package:gosnack_client/features/unit_cafeteria_selection/domain/entities/cafeteria.dart';
import 'package:gosnack_client/features/unit_cafeteria_selection/domain/interfaces/cafeteria_repository.dart';

/// Implementação de serviço do repositório de lanchonetes.
class CafeteriaRepositoryImpl implements CafeteriaRepository {
  // -- Instance Variables -------------------------------------------------- //

  /// Data source do Firestore.
  final CafeteriaFirestoreDataSource datasource;

  // -- Public Constructor -------------------------------------------------- //

  CafeteriaRepositoryImpl(this.datasource);

  // -- Public Override Methods --------------------------------------------- //

  @override
  Future<List<Cafeteria>> getCafeteriasByUnitId(String unitId) async {
    // Obter todas as lanchonetes do data source
    final models = await datasource.getAllCafeteriasByUnit(unitId);
    // Mapear para entidades
    return models.map(CafeteriaMapper.toEntity).toList();
  }

  @override
  Future<Cafeteria?> getCafeteriaById(String unitId, String cafeteriaId) async {
    // Obter a lanchonete do data source
    final model = await datasource.getCafeteriaById(unitId, cafeteriaId);
    // Retornar como entidade ou nulo
    if (model == null) return null;
    return CafeteriaMapper.toEntity(model);
  }
}
