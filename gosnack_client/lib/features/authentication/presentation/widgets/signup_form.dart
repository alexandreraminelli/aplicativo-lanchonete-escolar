import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:gosnack_client/features/authentication/presentation/controllers/signup_controller.dart';
import 'package:gosnack_client/features/authentication/presentation/texts/auth_texts.dart';
import 'package:gosnack_client/features/authentication/presentation/validators/auth_validators.dart';
import 'package:gosnack_client/core/resources/icons/icons.dart';
import 'package:gosnack_client/core/constants/styles/sizes.dart';
import 'package:hugeicons/hugeicons.dart';

class SignUpForm extends GetView<SignUpController> {
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
      // controller:
      controller: controller.firstName,
      validator: (String? value) =>
          AuthValidators.validateName(NamePart.firstName, value),
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
      // controller:
      controller: controller.lastName,
      validator: (String? value) =>
          AuthValidators.validateName(NamePart.lastName, value),
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
      textInputAction: TextInputAction.done,
      // controller:
      controller: controller.password,
      validator: (String? value) => AuthValidators.validatePassword(value),
    );

    // -- Submit Button
    final submitButton = SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        label: const Text(AuthTexts.createAccount),
        icon: const HugeIcon(icon: KIcons.create),

        onPressed: () => controller.signUp(), // submeter form e criar conta
      ),
    );

    // -- Main Widget
    return Form(
      key: controller.signupFormKey, // Chave do formulário
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
          const SizedBox(height: KSizes.xl),
        ],
      ),
    );
  }
}
