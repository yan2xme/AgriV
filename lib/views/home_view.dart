import 'package:agrivysor_ryzen/views/diagnostic_result.dart';
import 'package:agrivysor_ryzen/views/history_view.dart';
import 'package:agrivysor_ryzen/views/photo_capture.dart';
import 'package:agrivysor_ryzen/viewsmodels/scanner_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';
import 'components/disease_card.dart';
import '../models/disease_model.dart';

// Changed to StatefulWidget
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///top header
            Stack(
              children: <Widget>[
                Container(
                  height: 220,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('lib/views/assets/bgFarm.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.all(110),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Colors.white.withAlpha(0),
                        Colors.white24,
                        Colors.white,
                      ],
                    ),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.fromLTRB(23, 120, 20, 0),
                  child: const StrokeText(
                    text: 'Magsasaka!',
                    textStyle: TextStyle(
                      fontFamily: 'Space Grotesk',
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4F6F52),
                    ),
                    strokeColor: Colors.white,
                  ),
                ),

                Container(
                  padding: const EdgeInsets.fromLTRB(25, 230, 20, 0),
                  child: const Text(
                    "Tara na't magscan ng mga pananim!",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),

                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    margin: const EdgeInsets.only(top: 80),
                    height: 180,
                    width: 180,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/views/assets/carabaoFarmer.png'),
                      ),
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 130,
                    width: 150,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/views/assets/logo.png'),
                      ),
                    ),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.fromLTRB(25, 100, 20, 0),
                  child: const StrokeText(
                    text: 'Magandang araw,',
                    textStyle: TextStyle(
                      fontFamily: 'Space Grotesk',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4F6F52),
                    ),
                    strokeColor: Colors.white,
                  ),
                ),

                Container(
                  padding: const EdgeInsets.fromLTRB(25, 140, 20, 0),
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/views/assets/magsasaka.png'),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            /// Row Buttons
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PhotoCapture(),
                        ),
                      );
                    },
                    child: Container(
                      width: 165,
                      height: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFFF2F2F2),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xFFCBFFDD),
                              ),
                              width: 45,
                              height: 45,
                            ),

                            Container(
                              height: 30,
                              width: 30,
                              margin: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('lib/views/assets/scan.png'),
                                ),
                              ),
                            ),

                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                              child: const Text(
                                "I-Scan sa Camera",
                                style: TextStyle(
                                  fontSize: 20,
                                  height: 0.9,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF4F6F52),
                                ),
                              ),
                            ),

                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 115, 0, 0),
                              width: 80,
                              child: RichText(
                                text: const TextSpan(
                                  text: "Realtime na AI Scanning",
                                  style: TextStyle(
                                    fontSize: 12,
                                    height: 1,
                                    fontFamily: 'Space Grotesk',
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF757776),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () async {
                      final scanner = ScannerViewModel();
                      await scanner.pickAndProcessImage(context);
                      // Refresh HomeView after gallery scan completes
                      if (mounted) setState(() {});
                    },
                    child: Container(
                      width: 165,
                      height: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFFF2F2F2),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xFFCBFFDD),
                              ),
                              width: 45,
                              height: 45,
                            ),

                            Container(
                              height: 30,
                              width: 30,
                              margin: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('lib/views/assets/gallery.png'),
                                ),
                              ),
                            ),

                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                              child: const Text(
                                "Mag-upload mula sa Gallery",
                                style: TextStyle(
                                  fontSize: 20,
                                  height: 0.9,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF4F6F52),
                                ),
                              ),
                            ),

                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 115, 0, 0),
                              width: 80,
                              child: RichText(
                                text: const TextSpan(
                                  text: "Magselect ng dating photo",
                                  style: TextStyle(
                                    fontSize: 12,
                                    height: 1,
                                    fontFamily: 'Space Grotesk',
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF757776),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            ///lower body
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const SizedBox(
                    width: 240,
                    child: Text(
                      'Mga nakaraang na-diagnose',
                      style: TextStyle(
                        fontFamily: 'Space Grotesk',
                        fontSize: 22,
                        height: 0.9,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF4F6F52),
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HistoryView(),
                        ),
                      ).then((_) {
                        // FIX: setState now works because this is a StatefulWidget
                        if (mounted) {
                          setState(() {});
                        }
                      });
                    },
                    child: const Text(
                      'View All',
                      style: TextStyle(
                        fontFamily: 'Space Grotesk',
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF4F6F52),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              width: double.infinity,
              height: 250,
              child: ScannerViewModel.scanHistoryMap.isEmpty
                  ? const Center(
                child: Text(
                  'Mag-scan na para makita ang resulta dito!',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              )
                  : ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: ScannerViewModel.scanHistoryMap.length,
                itemBuilder: (context, index) {
                  final reversedIndex = (ScannerViewModel.scanHistoryMap.length - 1) - index;
                  final historyEntry = ScannerViewModel.scanHistoryMap.values.elementAt(reversedIndex);

                  final disease = historyEntry['disease'] as DiseaseModel;
                  final scanDate = historyEntry['date'] as String;
                  final imagePath = historyEntry['imagePath'] as String;
                  final confidence = historyEntry['confidence'] as double;

                  return Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DiagnosticResult(
                              isFromScanner: false,
                              disease: disease,
                              imagePath: imagePath,
                              confidenceLevel: confidence,
                              scanDate: scanDate,
                            ),
                          ),
                        );
                      },
                      child: DiseaseCard(
                        name: disease.name,
                        date: scanDate,
                        severity: disease.severity,
                        layoutType: CardType.homePageRecent,
                        imagePath: imagePath,
                        confidence: confidence,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}