import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

/// Funções auxiliares diversas.
/// Helper functions para várias usos.
class HelperFunctions {
  /// Obter a safe area superior do dispositivo.
  static double getTopSafeArea(BuildContext context) {
    return MediaQuery.of(context).viewPadding.top;
  }

  /// Obter a safe area inferior do dispositivo.
  static double getBottomSafeArea(BuildContext context) {
    return MediaQuery.of(context).viewPadding.bottom;
  }

  /// Mostrar um SnackBar com a mensagem fornecida.
  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  /// Mostrar um alert dialog com título e mensagem fornecidos.
  static void showAlert(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // fechar dialog
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  /// Navegar para a tela fornecida.
  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  /// Truncar o texto se exceder o comprimento máximo informado.
  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return "${text.substring(0, maxLength)}...";
    }
  }

  /// Verificar se o modo escuro está ativado.
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  /// Obter o tamanho da tela do dispositivo.
  static Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  // Obter a altura da tela do dispositivo.
  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /// Obter a largura da tela do dispositivo.
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// Formatar a data fornecida no formato especificado.
  static String getFormattedDate(
    DateTime date, {
    String format = "dd MMM yyyy",
  }) {
    return DateFormat(format).format(date);
  }

  /// Remover elementos duplicados de uma lista.
  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  /// Agrupar widgets em linhas com o tamanho especificado.
  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(
        i,
        (i + rowSize > widgets.length) ? widgets.length : (i + rowSize),
      );
      wrappedList.add(Row(children: rowChildren));
    }
    return wrappedList;
  }
}
