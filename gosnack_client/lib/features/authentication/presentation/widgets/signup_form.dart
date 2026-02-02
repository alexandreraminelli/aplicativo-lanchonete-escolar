import 'package:flutter/material.dart';
import 'package:gosnack_client/features/authentication/presentation/texts/auth_texts.dart';
import 'package:gosnack_client/utils/constants/content/icons.dart';
import 'package:gosnack_client/utils/constants/styles/sizes.dart';
import 'package:hugeicons/hugeicons.dart';

class SignUpForm extends StatelessWidget {
  // -- Public Constructor -------------------------------------------------- //

  const SignUpForm({super.key});

  // -- Build Method -------------------------------------------------------- //

  @override
  Widget build(BuildContext context) {
    // -- First Name Field
    final firstNameField = TextFormField(
      decoration: const InputDecoration(
        labelText: AuthTexts.firstName,
        prefixIcon: HugeIcon(icon: KIcons.name),
      ),
      // keyboard config:
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
    );

    // -- Last Name Field
    final lastNameField = TextFormField(
      decoration: const InputDecoration(
        labelText: AuthTexts.lastName,
        prefixIcon: HugeIcon(icon: KIcons.name),
      ),
      // keyboard config:
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
    );

    // -- Email Field
    final emailField = TextFormField(
      decoration: const InputDecoration(
        labelText: AuthTexts.email,
        prefixIcon: HugeIcon(icon: KIcons.email),
      ),
      // keyboard config:
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
    );

    // -- Password Field
    final passwordField = TextFormField(
      decoration: const InputDecoration(
        labelText: AuthTexts.password,
        prefixIcon: HugeIcon(icon: KIcons.password),
      ),
      // keyboard config:
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
    );

    // -- Submit Button
    final submitButton = SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        label: const Text(AuthTexts.createAccount),
        icon: const HugeIcon(icon: KIcons.create),

        onPressed: () {
          // TODO: criar conta
        },
      ),
    );

    // -- Main Widget
    return Form(
      child: Column(
        children: [
          // -- Fields
          Column(
            spacing: KSizes.spacingBtwFields,
            children: [
              firstNameField,
              lastNameField,
              emailField,
              passwordField,
            ],
          ),
          const SizedBox(height: KSizes.xl),
          submitButton, // Botão de enviar
        ],
      ),
    );
  }
}
