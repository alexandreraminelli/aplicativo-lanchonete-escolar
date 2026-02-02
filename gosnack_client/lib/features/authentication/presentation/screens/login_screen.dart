import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:gosnack_client/common/widgets/appbar/main_appbar.dart';
import 'package:gosnack_client/common/widgets/text/section_header.dart';
import 'package:gosnack_client/features/authentication/presentation/texts/auth_texts.dart';
import 'package:gosnack_client/features/authentication/presentation/widgets/login_form.dart';
import 'package:gosnack_client/routes/routes.dart';
import 'package:gosnack_client/utils/constants/content/icons.dart';
import 'package:gosnack_client/utils/constants/styles/sizes.dart';
import 'package:gosnack_client/utils/constants/styles/spacing.dart';
import 'package:gosnack_client/utils/device/device_utility.dart';
import 'package:hugeicons/hugeicons.dart';

/// Widget da tela de login.
class LoginScreen extends StatelessWidget {
  // -- Public Constructor -------------------------------------------------- //

  const LoginScreen({super.key});

  // -- Build Method -------------------------------------------------------- //

  @override
  Widget build(BuildContext context) {
    // -- Botão de Criar Conta
    final createAccountButton = SizedBox(
      width: double.infinity,
      child: FilledButton.icon(
        label: const Text(AuthTexts.createAccount),
        icon: const HugeIcon(icon: KIcons.create),
        // abrir tela de criar conta
        onPressed: () => Get.toNamed(KRoutes.signup),
      ),
    );

    // -- Botão de Entrar como Convidado
    final guestLoginButton = SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {
          // TODO: abrir tela de informações de convidado
        },
        child: const Text(AuthTexts.guestLogin),
      ),
    );

    // -- Main Widget
    return Scaffold(
      // -- AppBar
      appBar: const MainAppbar(),
      // -- Body
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight:
                DeviceUtils.getScreenHeight(context) -
                DeviceUtils.getAppBarHeight() -
                DeviceUtils.getStatusBarHeight(context),
          ),

          child: IntrinsicHeight(
            child: Padding(
              padding: KSpacing.horizontalScreenPadding,
              child: Column(
                children: [
                  // -- Header
                  const SectionHeader(
                    title: AuthTexts.loginPageTitle,
                    subtitle: AuthTexts.loginPageSubtitle,
                    padding: KSpacing.verticalLg,
                  ),

                  // -- Form
                  const LoginForm(),

                  // -- Footer
                  const Spacer(),
                  createAccountButton,
                  const SizedBox(height: KSizes.spacingBtwItems),
                  guestLoginButton,
                  const SizedBox(height: KSizes.spacingBtwSections),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
