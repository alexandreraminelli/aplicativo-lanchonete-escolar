import 'package:gosnack_client/utils/constants/content/texts/error_texts.dart';

/// Exceção lançada quando não há conexão com a internet.
class NoInternetException implements Exception {
  final String message;

  const NoInternetException([this.message = ErrorTexts.noInternetTitle]);

  @override
  String toString() => message;
}
