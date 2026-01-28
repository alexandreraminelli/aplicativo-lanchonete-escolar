import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

/// DataSource local para armazenamento de informações de autenticação.
class AuthLocalDatasource {
  // -- GetStorage Keys ----------------------------------------------------- //

  /// Chave do GetStorage com o booleano de se é a primeira vez que o
  /// usuário está acessando o app.
  static const String _keyFirstTime = 'isFirstTime';

  // -- Private Instance Variables ------------------------------------------ //

  /// Instância do GetStorage para armazenamento local.
  final GetStorage _storage;

  final Logger _logger = Logger();

  // -- Public Constructor -------------------------------------------------- //

  AuthLocalDatasource(this._storage);

  // -- Public Methods ------------------------------------------------------ //

  /// Verifica se é a primeira vez que o app é aberto.
  bool isFirstTime() {
    try {
      return _storage.read(_keyFirstTime) ?? true;
    } catch (e) {
      // Em caso de erro, assume que é a primeira vez
      return false;
    }
  }

  /// Marca que o usuário já abriu o app e passou pelo onboarding.
  Future<void> setFirstTimeFalse() async {
    try {
      await _storage.write(_keyFirstTime, false);
    } catch (e) {
      _logger.e('Erro ao salvar isFirstTime', error: e);
    }
  }
}
