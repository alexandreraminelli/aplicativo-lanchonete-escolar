import 'package:gosnack_client/core/resources/icons/icons.dart';
import 'package:gosnack_client/core/resources/strings/error_texts.dart';
import 'package:gosnack_client/core/widgets/feedback/snackbars.dart';

/// Chamadas de SnackBars frequentemente usadas na aplicação.
abstract final class CommonSnackBars {
  // -- Erros SnackBars ----------------------------------------------------- //

  /// Exibe um SnackBar de sem conexão com a internet.
  static void showNoInternetSnackBar() {
    AppSnackBars.showErrorSnackBar(
      title: ErrorTexts.noInternetTitle,
      message: ErrorTexts.noInternetSubtitle,
      icon: KIcons.noInternet,
    );
  }
}
