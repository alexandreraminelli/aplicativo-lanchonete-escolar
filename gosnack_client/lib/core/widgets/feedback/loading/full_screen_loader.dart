import 'package:flutter/material.dart';
import 'package:gosnack_client/core/constants/styles/sizes.dart';

/// Widget de tela de carregamento em tela cheia.
class FullScreenLoader extends StatelessWidget {
  // -- Public Instance Variables ------------------------------------------- //

  /// Mensagem opcional a ser exibida abaixo do indicador de carregamento.
  final String? message;

  // -- Public Constructor -------------------------------------------------- //

  const FullScreenLoader({super.key, this.message});

  // -- Build Method -------------------------------------------------------- //
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Material(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: KSizes.sm,
              children: [
                // Círculo de carregamento
                const CircularProgressIndicator(),
                // Mensagem
                if (message != null) Text(message!),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
