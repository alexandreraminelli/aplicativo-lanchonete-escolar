import 'package:logger/logger.dart';

/// Utilitário centralizado para logging.
///
/// Encapsula a biblioteca `logger` e fornece métodos personalizados
/// para diferentes níveis de log.
class LoggerHelp {
  // -- Private Static Variables -------------------------------------------- //

  /// Instância privada do `Logger`.
  static final Logger _logger = Logger(
    // Formatação da saída
    printer: PrettyPrinter(
      methodCount: 2, // Número de métodos a serem exibidos na stack trace
      errorMethodCount: 8, // Número de métodos para erros

      lineLength: 120, // Comprimento máximo da linha

      colors: true, // Habilita cores na saída
      printEmojis: true, // Habilita emojis na saída

      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
    ),

    level: Level.debug, // Nível mínimo de log
  );

  // -- Public Static Methods ----------------------------------------------- //

  /// Log de debug (desenvolvimento).
  static void debug(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _logger.d(message, error: error, stackTrace: stackTrace);
  }

  /// Log informativo.
  static void info(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _logger.i(message, error: error, stackTrace: stackTrace);
  }

  /// Log de aviso.
  static void warning(
    dynamic message, [
    dynamic error,
    StackTrace? stackTrace,
  ]) {
    _logger.w(message, error: error, stackTrace: stackTrace);
  }

  /// Log de erro.
  static void error(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    LoggerHelp.error(message, error: error, stackTrace: stackTrace);
  }

  /// Log de erro fatal.
  static void fatal(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _logger.f(message, error: error, stackTrace: stackTrace);
  }

  /// Log de requisição HTTP.
  static void request(String method, String url, {Map<String, dynamic>? data}) {
    _logger.i('[$method] $url${data != null ? '\nData: $data' : ''}');
  }

  /// Log de resposta HTTP.
  static void response(int statusCode, String url, {dynamic data}) {
    _logger.i('[$statusCode] $url${data != null ? '\nResponse: $data' : ''}');
  }
}
