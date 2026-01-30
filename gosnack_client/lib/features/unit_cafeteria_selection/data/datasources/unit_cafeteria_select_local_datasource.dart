import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

/// DataSource local para armazenar a unidade e lanchonete selecionada.
class UnitCafeteriaSelectLocalDatasource {
  // -- GetStorage Keys ----------------------------------------------------- //

  /// Chave do GetStorage com o ID da unidade selecionada.
  static const String _keySelectedUnitId = 'selectedUnitId';

  /// Chave do GetStorage com o ID da lanchonete selecionada.
  static const String _keySelectedCafeteriaId = 'selectedCafeteriaId';

  // -- Private Instance Variables ------------------------------------------ //

  final GetStorage _storage;
  final Logger _logger = Logger();

  // -- Public Constructor -------------------------------------------------- //

  UnitCafeteriaSelectLocalDatasource(this._storage);

  // -- Public Methods ------------------------------------------------------ //

  // -- Getters

  /// Obtêm o ID da unidade selecionada.
  /// Se não houver ou ocorrer um erro, retorna `null`.
  String? getSelectedUnitId() {
    try {
      return _storage.read(_keySelectedUnitId);
    } catch (e) {
      _logger.e('Erro ao ler selectedUnitId', error: e);
      return null;
    }
  }

  /// Obtêm o ID da lanchonete selecionada.
  /// Se não houver ou ocorrer um erro, retorna `null`.
  String? getSelectedCafeteriaId() {
    try {
      return _storage.read(_keySelectedCafeteriaId);
    } catch (e) {
      _logger.e('Erro ao ler selectedCafeteriaId', error: e);
      return null;
    }
  }

  // -- Checkers

  /// Verifica se há uma unidade selecionada.
  bool isUnitSelected() {
    try {
      return getSelectedUnitId() != null;
    } catch (e) {
      _logger.e('Erro ao verificar unidade selecionada', error: e);
      return false;
    }
  }

  /// Verifica se há uma lanchonete selecionada.
  bool isCafeteriaSelected() {
    try {
      return getSelectedCafeteriaId() != null;
    } catch (e) {
      _logger.e('Erro ao verificar lanchonete selecionada', error: e);
      return false;
    }
  }

  // -- Setters

  /// Salvar o ID da unidade selecionada.
  Future<void> saveSelectedUnitId(String unitId) async {
    try {
      await _storage.write(_keySelectedUnitId, unitId);
      _logger.i('Unidade selecionada salva: $unitId');
    } catch (e) {
      _logger.e('Erro ao salvar selectedUnitId', error: e);
    }
  }

  /// Salvar o ID da lanchonete selecionada.
  Future<void> saveSelectedCafeteriaId(String cafeteriaId) async {
    try {
      await _storage.write(_keySelectedCafeteriaId, cafeteriaId);
      _logger.i('Lanchonete selecionada salva: $cafeteriaId');
    } catch (e) {
      _logger.e('Erro ao salvar selectedCafeteriaId', error: e);
    }
  }

  /// Limpar as seleções locais de unidade e lanchonete.
  Future<void> clearSelections() async {
    try {
      await _storage.remove(_keySelectedUnitId);
      await _storage.remove(_keySelectedCafeteriaId);
    } catch (e) {
      _logger.e('Erro ao limpar seleções', error: e);
    }
  }
}
