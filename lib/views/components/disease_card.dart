import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'dart:io';

enum CardType { homePageRecent, diseaseLibrary, historyPage, diagnosticResult }

class DiseaseCard extends StatelessWidget {
  final String name;
  final String? date;
  final String? severity;
  final double? confidence;
  final String? description;
  final CardType layoutType;
  final bool isFromScanner;
  final String? imagePath;

  const DiseaseCard({
    super.key,
    this.isFromScanner = true,
    required this.name,
    required this.layoutType,
    this.imagePath,
    this.date,
    this.severity,
    this.confidence,
    this.description,
  });

  // ==========================================
  // MAGIC HELPER: Bulletproof Image Loader
  // ==========================================
  Widget _buildImage(String? path) {
    // 1. Fallback for null paths
    if (path == null || path.isEmpty) {
      return Image.asset(
        'lib/views/assets/example.jpg',
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        errorBuilder: (context, error, stackTrace) => Container(
          color: Colors.grey[300],
          child: const Center(
            child: Icon(Icons.broken_image, color: Colors.grey),
          ),
        ),
      );
    }

    // 2. Safely handle bundled Assets (Library View)
    if (path.startsWith('lib/') || path.startsWith('assets/')) {
      return Image.asset(
        path,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        errorBuilder: (context, error, stackTrace) {
          debugPrint("🚨 ASSET MISSING: $path");
          return Container(
            color: Colors.grey[300],
            child: const Center(
              child: Icon(Icons.image_not_supported, color: Colors.grey),
            ),
          );
        },
      );
    }

    // 3. Handle Local Files (Camera/Scanner)
    return Image.file(
      File(path),
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      errorBuilder: (context, error, stackTrace) {
        debugPrint("🚨 FILE MISSING: $path");
        return Container(
          color: Colors.grey[300],
          child: const Center(
            child: Icon(Icons.broken_image, color: Colors.grey),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color severityColor = switch (severity) {
      'HEALTHY' => const Color(0xFF4CAF50), // Green 🟢
      'LOW RISK' => const Color(0xFF4CAF50), // Green 🟢
      'MID RISK' => const Color(0xFFE6B900), // Amber/Yellow 🟡
      'HIGH RISK' => const Color(0xFFCC0000), // Red 🔴
      'UNKNOWN' => const Color(0xFFB71C1C), // Deep Red 🩸
      _ => const Color(0xFF757776), // Default Grey ⚪
    };

    switch (layoutType) {
      /// 1. Home Page Recent
      case CardType.homePageRecent:
        return Stack(
          children: <Widget>[
            Container(
              width: 210,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: .2),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
            ),
            Container(
              width: 210,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
            ),
            // REFACTORED IMAGE
            SizedBox(
              width: 210,
              height: 85,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: _buildImage(imagePath),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 90, 20, 0),
              width: 150,
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 20,
                  height: 0.9,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF4F6F52),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 160, 20, 0),
              child: RichText(
                text: TextSpan(
                  text: (date),
                  style: const TextStyle(
                    fontSize: 12,
                    height: 1,
                    fontFamily: 'Space Grotesk',
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF757776),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(170, 110, 0, 0),
              width: 12,
              height: 12,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/views/assets/next.png'),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(120, 10, 0, 0),
              width: 75,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: Colors.white,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(120, 10, 0, 0),
              width: 75,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: severityColor.withValues(alpha: 0.3),
              ),
            ),

            Container(
              margin: const EdgeInsets.fromLTRB(128, 11, 0, 0),
              child: Text(
                severity ?? 'N/A',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: severityColor,
                ),
              ),
            ),
          ],
        );

      /// 2. Disease Library
      case CardType.diseaseLibrary:
        return Stack(
          children: <Widget>[
            Container(
              width: 370,
              height: 255,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: .2),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
            ),
            Container(
              width: 370,
              height: 255,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
            ),
            // REFACTORED IMAGE
            SizedBox(
              width: 370,
              height: 130,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: _buildImage(imagePath),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 145, 20, 0),
              width: 280,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(
                  name,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 22,
                    height: 0.9,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF4F6F52),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 175, 55, 0),
              child: Text(
                description ?? 'No description available.',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  height: 1.2,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF757776),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 225, 20, 0),
              child: const Text(
                'View Details',
                style: TextStyle(
                  fontSize: 12,
                  height: 1.2,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF757776),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(115, 229, 0, 0),
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/views/assets/next.png'),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(273, 150, 0, 0),
              width: 75,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: severityColor.withAlpha(40),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(280, 150, 0, 0),
              child: Text(
                severity ?? 'N/A',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: severityColor,
                ),
              ),
            ),
          ],
        );

      /// 3. History Page
      case CardType.historyPage:
        return Stack(
          children: <Widget>[
            Container(
              width: 370,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: .2),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
            ),
            Container(
              width: 370,
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
            ),
            // REFACTORED IMAGE
            Container(
              margin: const EdgeInsets.fromLTRB(18, 18, 0, 0),
              width: 100,
              height: 100,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: _buildImage(imagePath),
              ),
            ),
            Container(
              width: 370,
              // Shifted left padding to 130 so it aligns perfectly with your Severity tag below it!
              padding: const EdgeInsets.fromLTRB(130, 22, 110, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    // Adds "..." if it's 3 lines long
                    style: const TextStyle(
                      fontSize: 18,
                      // Standardized size so "Unknown" and long names match perfectly
                      height: 1.2,
                      // Clean breathing room for two lines
                      fontFamily: 'Space Grotesk',
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF4F6F52),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(50, 100, 20, 0),
              child: Align(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    text: (date),
                    style: const TextStyle(
                      fontSize: 12,
                      height: 1,
                      fontFamily: 'Space Grotesk',
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF757776),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(130, 65, 0, 0),
              width: 85,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: severityColor.withAlpha(10),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(140, 65, 0, 0),
              child: Text(
                severity ?? 'N/A',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: severityColor,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(240, 15, 0, 0),
              width: 100,
              height: 100,
              child: PieChart(
                PieChartData(
                  startDegreeOffset: 360,
                  sections: [
                    PieChartSectionData(
                      value: 100 - (confidence ?? 0),
                      radius: 15,
                      showTitle: false,
                      color: Colors.grey,
                    ),
                    PieChartSectionData(
                      value: confidence ?? 0,
                      radius: 15,
                      showTitle: false,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 70,
              margin: const EdgeInsets.fromLTRB(260, 48, 20, 0),
              child: RichText(
                text: const TextSpan(
                  text: ('Confidence:'),
                  style: TextStyle(
                    fontSize: 10,
                    height: 1,
                    fontFamily: 'Space Grotesk',
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF757776),
                  ),
                ),
              ),
            ),
            Container(
              width: 70,
              margin: const EdgeInsets.fromLTRB(260, 60, 20, 0),
              child: RichText(
                text: TextSpan(
                  text: ('${(confidence ?? 0.0).toStringAsFixed(1)}%'),
                  style: const TextStyle(
                    fontSize: 18,
                    height: 1,
                    fontFamily: 'Space Grotesk',
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF757776),
                  ),
                ),
              ),
            ),
          ],
        );

      /// 4. Diagnostic Result
      case CardType.diagnosticResult:
        return Stack(
          children: <Widget>[
            Container(
              width: 370,
              height: 280,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: .2),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
            ),
            Container(
              width: 370,
              height: 280,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFFF9FAF8),
              ),
            ),
            // REFACTORED IMAGE
            Container(
              margin: const EdgeInsets.fromLTRB(25, 18, 0, 0),
              width: isFromScanner ? 140 : 300,
              height: 140,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: _buildImage(imagePath),
              ),
            ),
            Container(
              width: 450,
              padding: const EdgeInsets.fromLTRB(20, 180, 20, 0),
              child: Align(
                alignment: Alignment.center,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    maxLines: 2,
                    name,
                    style: const TextStyle(
                      fontSize: 24,
                      height: 0.9,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF4F6F52),
                    ),
                  ),
                ),
              ),
            ),
            if (isFromScanner)
              Container(
                padding: const EdgeInsets.fromLTRB(20, 250, 20, 0),
                child: Align(
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                      text: (date),
                      style: const TextStyle(
                        fontSize: 12,
                        height: 1,
                        fontFamily: 'Space Grotesk',
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF757776),
                      ),
                    ),
                  ),
                ),
              ),
            Container(
              margin: const EdgeInsets.fromLTRB(176, 210, 0, 0),
              width: 105,
              height: 25,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: severityColor.withAlpha(10),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(185, 210, 0, 0),
              child: Text(
                severity ?? 'PENDING',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: severityColor,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(90, 210, 0, 0),
              child: const Text(
                'Severity:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xFF757776),
                ),
              ),
            ),
            if (isFromScanner)
              Container(
                margin: const EdgeInsets.fromLTRB(190, 15, 0, 0),
                width: 140,
                height: 140,
                child: PieChart(
                  PieChartData(
                    startDegreeOffset: 360,
                    sections: [
                      PieChartSectionData(
                        value: 100 - (confidence ?? 0.00),
                        radius: 15,
                        showTitle: false,
                        color: Colors.grey,
                      ),
                      PieChartSectionData(
                        value: (confidence ?? 0.00),
                        radius: 15,
                        showTitle: false,
                        color: Colors.green,
                      ),
                    ],
                  ),
                ),
              ),
            if (isFromScanner)
              Container(
                width: 400,
                padding: const EdgeInsets.fromLTRB(215, 60, 20, 0),
                child: RichText(
                  text: const TextSpan(
                    text: ('Confidence:'),
                    style: TextStyle(
                      fontSize: 16,
                      height: 1,
                      fontFamily: 'Space Grotesk',
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF757776),
                    ),
                  ),
                ),
              ),
            if (isFromScanner)
              Container(
                width: 400,
                padding: const EdgeInsets.fromLTRB(215, 80, 20, 0),
                child: RichText(
                  text: TextSpan(
                    text: ('${(confidence ?? 0).toStringAsFixed(2)}%'),
                    style: const TextStyle(
                      fontSize: 22,
                      height: 1,
                      fontFamily: 'Space Grotesk',
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF757776),
                    ),
                  ),
                ),
              ),
          ],
        );
    }
  }
}
