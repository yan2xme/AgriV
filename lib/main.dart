import 'package:agrivysor_ryzen/viewsmodels/scanner_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'views/main_menu.dart';

// 1. Add Future<void> and async
Future<void> main() async {
  // 2. This line tells Flutter to hold on and set up its engine before running the app
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('chat_history');     // For the Chatbot
  await Hive.openBox('scanner_history');  // 🆕 ADDED: For the Home/History screen!

  // 🆕 ADDED: Load the scanner history into RAM before the app even draws the first frame
  ScannerViewModel.loadHistoryFromHive();

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