import 'package:flutter/material.dart';
import 'package:gosnack_client/core/widgets/appbar/main_appbar.dart';

/// Tela para verificação de e-mail.
class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // -- AppBar
      appBar: MainAppbar(),
      // -- Body
      body: Center(child: Text('Verify Email Screen')),
    );
  }
}
