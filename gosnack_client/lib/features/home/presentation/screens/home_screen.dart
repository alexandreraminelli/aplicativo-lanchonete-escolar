import 'package:flutter/material.dart';
import 'package:gosnack_client/common/widgets/appbar/main_appbar.dart';

/// Tela inicial do aplicativo.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // -- Appbar
      appBar: MainAppbar(),

      // -- Body
      body: Center(child: Text('Home Screen')),
    );
  }
}
