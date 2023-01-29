import 'package:flutter/material.dart';

import 'package:staffplan/utils/utils_barrel.dart'
    show GlobalStrings, StaffPlanTheme;
import 'package:staffplan/screens/screens_barrel.dart' show WelcomeScreen;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: GlobalStrings.title,
      debugShowCheckedModeBanner: false,
      theme: StaffPlanTheme.light(),
      home: const WelcomeScreen(),
    );
  }
}
