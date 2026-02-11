import 'package:gosnack_client/core/resources/strings/error_texts.dart';

/// Exceção lançada quando não há conexão com a internet.
class NoInternetException implements Exception {
  final String message;

  const NoInternetException([this.message = ErrorTexts.noInternetTitle]);

  @override
  String toString() => message;
}
