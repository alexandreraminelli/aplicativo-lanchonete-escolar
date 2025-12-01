import 'package:flutter/material.dart';

/// Tela de On Boarding exibida no primeiro uso do app.
class OnBoardingScreen extends StatelessWidget {
  // -- Public Constructor -------------------------------------------------- //
  const OnBoardingScreen({super.key});

  // -- Build Method -------------------------------------------------------- //
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "OnBoarding Screen",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
