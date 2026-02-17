import 'package:flutter/material.dart';
import 'package:gosnack_client/core/constants/enums.dart';
import 'package:gosnack_client/core/constants/styles/sizes.dart';
import 'package:gosnack_client/core/constants/styles/spacing.dart';
import 'package:gosnack_client/core/utils/device_utility.dart';
import 'package:gosnack_client/core/widgets/text/section_header.dart';
import 'package:lottie/lottie.dart';

/// Tela que exibe um feedback com imagem (estática ou animação), título,
/// descrição e botões de ação.
class FeedbackActionScreen extends StatelessWidget {
  // -- Instance Variables -------------------------------------------------- //

  /// Título do feedback.
  final String title;

  /// Subtítulo do feedback.
  final String? subtitle;

  /// Caminho da imagem a ser exibida.
  final String? imagePath;

  /// Tipo da imagem a ser exibida (estática ou animação).
  final ImageType imageType;

  /// Widgets opcionais exibidos abaixo do título e subtítulo.
  /// Exemplos: botões de ação, links, etc.
  final List<Widget> body;

  // -- Public Constructor -------------------------------------------------- //

  const FeedbackActionScreen({
    required this.title,
    this.subtitle,
    this.imagePath,
    this.imageType = ImageType.staticImage,
    this.body = const [],
    super.key,
  });

  // -- Build Method -------------------------------------------------------- //
  @override
  Widget build(BuildContext context) {
    // -- Image
    final imageWidth = DeviceUtils.getScreenWidth(context) * 0.6;
    final image = (imagePath == null)
        ? const SizedBox.shrink()
        : (imageType == ImageType.staticImage
              // Imagem estática
              ? Image.asset(imagePath!, width: imageWidth)
              // Animação Lottie
              : Lottie.asset(imagePath!, width: imageWidth));

    // -- Main Widget
    return Padding(
      padding: KSpacing.verticalMd,
      child: Column(
        spacing: KSizes.lg,
        children: [
          // -- Imagem
          image,

          // -- Título
          SectionHeader(title: title, subtitle: subtitle),

          // -- Body
          Column(spacing: KSizes.spacingBtwItems, children: body),
        ],
      ),
    );
  }
}
