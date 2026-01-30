import 'package:gosnack_client/features/unit_cafeteria_selection/data/datasources/firestore/cafeteria_firestore_datasource.dart';
import 'package:gosnack_client/features/unit_cafeteria_selection/data/datasources/firestore/unit_firestore_datasource.dart';
import 'package:gosnack_client/features/unit_cafeteria_selection/data/datasources/unit_cafeteria_select_local_datasource.dart';
import 'package:gosnack_client/features/unit_cafeteria_selection/data/mappers/cafeteria_mapper.dart';
import 'package:gosnack_client/features/unit_cafeteria_selection/data/mappers/unit_mapper.dart';
import 'package:gosnack_client/features/unit_cafeteria_selection/domain/entities/cafeteria_entity.dart';
import 'package:gosnack_client/features/unit_cafeteria_selection/domain/entities/unit_entity.dart';
import 'package:gosnack_client/features/unit_cafeteria_selection/domain/interfaces/unit_cafeteria_repository.dart';

/// Implementação concreta do repositório de unidades e lanchonetes.
class UnitCafeteriaRepositoryImpl implements UnitCafeteriaRepository {
  // -- Private Instance Variables ------------------------------------------ //

  // -- Datasources
  final UnitFirestoreDataSource _remoteUnitDatasource;
  final CafeteriaFirestoreDataSource _remoteCafeteriaDatasource;
  final UnitCafeteriaSelectLocalDatasource _localDatasource;

  // -- Public Constructor -------------------------------------------------- //

  UnitCafeteriaRepositoryImpl(
    this._remoteUnitDatasource,
    this._remoteCafeteriaDatasource,
    this._localDatasource,
  );

  // -- Public Override Methods --------------------------------------------- //

  // -- Units

  @override
  Future<List<UnitEntity>> getAllUnits() async {
    // Obter todas as unidades do data source
    final models = await _remoteUnitDatasource.getAllUnits();
    // Mapear para entidades
    return models.map(UnitMapper.toEntity).toList();
  }

  // -- Cafeteria

  @override
  Future<List<CafeteriaEntity>> getCafeteriasByUnitId(String unitId) async {
    // Obter todas as lanchonetes do data source
    final models = await _remoteCafeteriaDatasource.getAllCafeteriasByUnit(
      unitId,
    );
    // Mapear para entidades
    return models.map(CafeteriaMapper.toEntity).toList();
  }

  @override
  Future<CafeteriaEntity?> getCafeteriaById(
    String unitId,
    String cafeteriaId,
  ) async {
    // Obter a lanchonete do data source
    final model = await _remoteCafeteriaDatasource.getCafeteriaById(
      unitId,
      cafeteriaId,
    );
    // Retornar como entidade ou nulo
    if (model == null) return null;
    return CafeteriaMapper.toEntity(model);
  }

  // -- Selection

  @override
  Future<void> saveSelection({
    required String unitId,
    required String cafeteriaId,
  }) async {
    // Salvar IDs localmente
    await _localDatasource.saveSelectedUnitId(unitId);
    await _localDatasource.saveSelectedCafeteriaId(cafeteriaId);
  }

  @override
  Future<UnitEntity?> getSelectedUnit() async {
    final unitId = _localDatasource.getSelectedUnitId();
    if (unitId == null) return null;
    final unit = await _remoteUnitDatasource.getUnitById(unitId);
    return unit;
  }

  @override
  Future<CafeteriaEntity?> getSelectedCafeteria() async {
    final unitId = _localDatasource.getSelectedUnitId();
    final cafeteriaId = _localDatasource.getSelectedCafeteriaId();
    if (unitId == null || cafeteriaId == null) return null;
    final cafeteria = await _remoteCafeteriaDatasource.getCafeteriaById(
      unitId,
      cafeteriaId,
    );
    return cafeteria;
  }

  @override
  Future<void> clearSelection() async {
    await _localDatasource.clearSelections();
  }
}
