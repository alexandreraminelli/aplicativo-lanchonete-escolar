import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gosnack_client/core/widgets/feedback/loading/small_loading_indicator.dart';
import 'package:gosnack_client/features/authentication/presentation/controllers/login_controller.dart';
import 'package:gosnack_client/features/authentication/presentation/texts/auth_texts.dart';
import 'package:gosnack_client/core/resources/icons/icons.dart';
import 'package:gosnack_client/core/constants/styles/sizes.dart';
import 'package:gosnack_client/features/authentication/presentation/validators/auth_validators.dart';
import 'package:hugeicons/hugeicons.dart';

/// Formulário de login.
class LoginForm extends GetView<LoginController> {
  // -- Public Constructor -------------------------------------------------- //

  const LoginForm({super.key});

  // -- Build Method -------------------------------------------------------- //
  @override
  Widget build(BuildContext context) {
    // -- Email Field
    final emailField = TextFormField(
      decoration: const InputDecoration(
        labelText: AuthTexts.email,
        prefixIcon: HugeIcon(icon: KIcons.email),
      ),
      // keyboard config:
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      // controller:
      controller: controller.email,
      validator: (String? value) => AuthValidators.validateEmail(value),
    );

    // -- Password Field
    final passwordField = TextFormField(
      decoration: const InputDecoration(
        labelText: AuthTexts.password,
        prefixIcon: HugeIcon(icon: KIcons.password),
      ),
      // keyboard config:
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.send,
      // controller:
      controller: controller.password,
    );

    // -- Submit Button
    final submitButton = Obx(
      () => SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          label: const Text(AuthTexts.login),
          // Ícone e loading
          icon: controller.isSubmitting.value
              ? const SmallLoadingIndicator()
              : const HugeIcon(icon: KIcons.login),

          onPressed: controller.isSubmitting.value
              ? null // desabilitar durante envio
              : () => controller.login(), // efetuar login
        ),
      ),
    );

    // -- Main Widget
    return Form(
      key: controller.loginFormKey, // chave do formulário
      child: Column(
        children: [
          const SizedBox(height: KSizes.lg),

          emailField, // Email Field
          const SizedBox(height: KSizes.spacingBtwFields),
          passwordField, // Password Field

          const SizedBox(height: KSizes.xl),

          submitButton, // Submit Button
        ],
      ),
    );
  }
}
