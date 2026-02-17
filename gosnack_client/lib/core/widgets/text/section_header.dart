import 'package:flutter/material.dart';
import 'package:gosnack_client/core/constants/styles/sizes.dart';

/// Cabeçalho de seção com título e subtítulo.
class SectionHeader extends StatelessWidget {
  // -- Public Instance Variables ------------------------------------------- //

  /// Título da seção.
  final String title;

  /// Subtítulo da seção (opcional).
  final String? subtitle;

  /// Espaçamento interno ao redor do conteúdo do cabeçalho.
  final EdgeInsetsGeometry padding;

  // -- Public Constructor -------------------------------------------------- //

  const SectionHeader({
    required this.title,
    this.subtitle,
    this.padding = EdgeInsets.zero,
    super.key,
  });

  // -- Build Method -------------------------------------------------------- //
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: KSizes.sm, // gap
        children: [
          // -- Título
          Text(
            title,
            textAlign: TextAlign.center,
            style: textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          // -- Subtítulo
          if (subtitle != null)
            Text(
              subtitle!,
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium,
            ),
        ],
      ),
    );
  }
}
