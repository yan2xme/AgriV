import 'package:flutter/material.dart';
import 'views/main_menu.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgriVysor',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF4F6F52)),
        useMaterial3: true,
        fontFamily: 'Space Grotesk',
      ),

      home: MainMenu(),
    );
  }

}