import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gosnack_client/core/resources/icons/icons.dart';
import 'package:gosnack_client/core/resources/images/images_paths.dart';
import 'package:gosnack_client/core/constants/styles/sizes.dart';
import 'package:gosnack_client/core/utils/device_utility.dart';
import 'package:gosnack_client/core/utils/helper_functions.dart';
import 'package:hugeicons/hugeicons.dart';

/// Appbar principal do aplicativo.
class MainAppbar extends StatelessWidget implements PreferredSizeWidget {
  // -- Public Constructor -------------------------------------------------- //
  const MainAppbar({
    this.center = false,
    super.key,
    this.showBackButton = false,
    this.titleWidget,
  });

  // -- Public Instance Variables ------------------------------------------- //

  /// Se o Widget do título deve ser centralizado.
  final bool center;

  /// Se o botão de voltar deve ser exibido.
  final bool showBackButton;

  /// Widget personalizado para o título da AppBar. Se nulo, exibe a logo.
  final Widget? titleWidget;

  // -- Public Override Methods --- //

  // Tamanho preferido da AppBar.
  @override
  Size get preferredSize => Size.fromHeight(DeviceUtils.getAppBarHeight());

  // -- Build Method -------------------------------------------------------- //
  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);

    // -- Widgets internos

    /// Botão de voltar opcional.
    final Widget? backButton = showBackButton
        ? IconButton(
            onPressed: () {
              // voltar pra página anterior
              Get.back();
            },
            icon: const HugeIcon(icon: KIcons.arrowLeft, size: KSizes.xl),
          )
        : null;

    // -- Widget principal
    return AppBar(
      // Style
      backgroundColor: isDark ? Colors.black : Colors.white,
      foregroundColor: isDark ? Colors.white : Colors.black,

      // -- Botão de voltar
      automaticallyImplyLeading: false,
      leading: backButton,

      // -- Widget de Título
      centerTitle: (titleWidget != null) ? center : true,
      title:
          titleWidget ??
          // -- Logo do colégio (padrão se nenhum widget for fornecido)
          SvgPicture.asset(
            isDark ? KImages.logoWhiteSvg : KImages.logoBlackSvg,
            height: KSizes.xl,
            semanticsLabel: "Logo do colégio",
          ),
    );
  }
}
