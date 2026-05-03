import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; // Make sure this is imported
import 'views/main_menu.dart';

// 1. Add Future<void> and async
Future<void> main() async {
  // 2. This line tells Flutter to hold on and set up its engine before running the app
  WidgetsFlutterBinding.ensureInitialized();

  // 3. Load your secret API key
  await dotenv.load(fileName: ".env");

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