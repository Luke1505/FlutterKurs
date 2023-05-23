import 'package:flutter/material.dart';
import 'pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeData themeData = ThemeData.dark();
  MyApp({super.key});

  void setTheme(ThemeData theme) {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      theme: themeData,
    );
  }
}
