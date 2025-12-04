import 'package:flutter/material.dart';
import 'package:gosnack_client/utils/constants/styles/sizes.dart';

/// Cabeçalho de seção com título e subtítulo.
class SectionHeader extends StatelessWidget {
  // -- Public Constructor -------------------------------------------------- //
  const SectionHeader({required this.title, required this.subtitle, super.key});

  // -- Public Instance Variables ------------------------------------------- //
  final String title;
  final String subtitle;

  // -- Build Method -------------------------------------------------------- //
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: KSizes.xs, // gap
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
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: textTheme.bodyMedium,
        ),
      ],
    );
  }
}
