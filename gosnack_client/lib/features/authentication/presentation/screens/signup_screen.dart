import 'package:flutter/material.dart';
import 'package:gosnack_client/core/widgets/appbar/main_appbar.dart';
import 'package:gosnack_client/core/widgets/text/section_header.dart';
import 'package:gosnack_client/features/authentication/presentation/texts/auth_texts.dart';
import 'package:gosnack_client/features/authentication/presentation/widgets/signup_form.dart';
import 'package:gosnack_client/core/constants/styles/sizes.dart';
import 'package:gosnack_client/core/constants/styles/spacing.dart';

/// Tela de criar conta.
class SignUpScreen extends StatelessWidget {
  // -- Public Constructor -------------------------------------------------- //

  const SignUpScreen({super.key});

  // -- Build Method -------------------------------------------------------- //

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // -- Appbar
      appBar: MainAppbar(showBackButton: true),
      // -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: KSpacing.horizontalScreenPadding,
          child: Column(
            spacing: KSizes.md,
            children: [
              // -- Header
              SectionHeader(
                title: AuthTexts.signupPageTitle,
                subtitle: AuthTexts.signupPageSubtitle,
                padding: KSpacing.verticalLg,
              ),
              // -- Form
              SignUpForm(),
            ],
          ),
        ),
      ),
    );
  }
}
