import 'package:flutter/material.dart';
import 'package:staffplan/animations/animations_barrel.dart'
    show WelcomeAnimation;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: WelcomeAnimation(),
      ),
    );
  }
}
