import 'dart:async' show Timer;
import 'package:flutter/material.dart';

import 'package:staffplan/screens/screens_barrel.dart' show OnboardingScreen;

import 'package:staffplan/utils/utils_barrel.dart'
    show GlobalStrings, StaffPlanTheme;

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(
          seconds: 5,
        ), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        //extendBodyBehindAppBar: true,
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            GlobalStrings.logo,
            height: size.height * 0.08,
            width: size.width * 0.9,
          ),
          SizedBox(
            height: size.height * 0.010,
          ),
          Text(
            GlobalStrings.title,
            style: StaffPlanTheme.lightTextTheme.headline2?.copyWith(
              color: StaffPlanTheme.mainColor,
            ),
          )
        ],
      ),
    ));
  }
}
