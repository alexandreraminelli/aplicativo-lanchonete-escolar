import 'package:flutter/material.dart';
import 'package:gosnack_client/common/widgets/appbar/main_appbar.dart';

/// Widget da tela de login.
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MainAppbar(),
      body: Center(child: Column(children: [Text('Página de login')])),
    );
  }
}
