import 'package:flutter/material.dart';

class SplashScreenView extends StatelessWidget {
  static const String routeName = "/splash";

  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        width: double.infinity,
      ),
    ));
  }
}
