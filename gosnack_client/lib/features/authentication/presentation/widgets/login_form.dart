import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gosnack_client/features/authentication/presentation/controllers/login_controller.dart';
import 'package:gosnack_client/features/authentication/presentation/texts/auth_texts.dart';
import 'package:gosnack_client/core/resources/icons/icons.dart';
import 'package:gosnack_client/core/constants/styles/sizes.dart';
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
      controller: null, // TODO: Vincular ao controlador
      validator: (String? value) {
        // TODO: Implementar validação de e-mail
      },
      // keyboard config:
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      // aparência:
      decoration: const InputDecoration(
        labelText: AuthTexts.email,
        prefixIcon: HugeIcon(icon: KIcons.email),
      ),
    );

    // -- Password Field
    final passwordField = TextFormField(
      controller: null, // TODO: Vincular ao controlador
      // keyboard config:
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.send,
      // aparência:
      decoration: const InputDecoration(
        labelText: AuthTexts.password,
        prefixIcon: HugeIcon(icon: KIcons.password),
      ),
    );

    // -- Submit Button
    final submitButton = SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {
          // TODO: Implementar login
        },
        label: const Text(AuthTexts.login),
        icon: const HugeIcon(icon: KIcons.login),
      ),
    );

    // -- Main Widget
    return Form(
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
