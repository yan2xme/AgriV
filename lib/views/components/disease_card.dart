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

  @override
  Widget build(BuildContext context) {
    final Color severityColor = switch (severity) {
      'HEALTHY' => const Color(0xFF4CAF50),      // Green 🟢
      'LOW RISK' => const Color(0xFF4CAF50),      // Green 🟢
      'MID RISK' => const Color(0xFFE6B900),   // Amber/Yellow 🟡
      'HIGH RISK' => const Color(0xFFCC0000),     // Red 🔴
      'UNKNOWN' => const Color(0xFFB71C1C), // Deep Red 🩸
      _ => const Color(0xFF757776),          // Default Grey ⚪
    };

    switch (layoutType) {
      ///1
      case CardType.homePageRecent:
        return Stack(
          children: <Widget>[
            Container(
              width: 210,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: .2),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
            ),

            Container(
              width: 210,
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
            ),

            Container(
              width: 210,
              height: 85,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imagePath != null
                      ? FileImage(File(imagePath!)) as ImageProvider
                      : const AssetImage('lib/views/assets/example.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.fromLTRB(20, 90, 20, 0),
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 20,
                  height: 0.9,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF4F6F52),
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.fromLTRB(20, 110, 20, 0),
              child: RichText(
                text: TextSpan(
                  text: (date),
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

            Container(
              margin: EdgeInsets.fromLTRB(170, 110, 0, 0),
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/views/assets/next.png'),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.fromLTRB(120, 10, 0, 0),
              width: 75,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color(0xFFFFE1E1),
              ),
            ),

            Container(
              margin: EdgeInsets.fromLTRB(128, 11, 0, 0),
              child: Text(
                severity!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: severityColor,
                ),
              ),
            ),
          ],
        );

      ///2library
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
                    offset: Offset(0, 4),
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

            Container(
              width: 370,
              height: 130,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imagePath != null
                      ? FileImage(File(imagePath!)) as ImageProvider
                      : const AssetImage('lib/views/assets/example.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.fromLTRB(20, 145, 20, 0),
              width: 280,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(
                  name,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 22,
                    height: 0.9,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF4F6F52),
                  ),
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.fromLTRB(20, 175, 55, 0),
              child: Text(
                description ?? 'No description available.',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                  height: 1.2,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF757776),
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.fromLTRB(20, 225, 20, 0),
              child: Text(
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
              margin: EdgeInsets.fromLTRB(115, 229, 0, 0),
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/views/assets/next.png'),
                ),
              ),
            ),


            Container(
              margin: EdgeInsets.fromLTRB(273, 150, 0, 0),
              width: 75,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: severityColor.withAlpha(40),
              ),
            ),

            Container(
              margin: EdgeInsets.fromLTRB(280, 150, 0, 0),
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

      ///3
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
                    offset: Offset(0, 4),
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

            Container(
              margin: EdgeInsets.fromLTRB(18, 18, 0, 0),
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/views/assets/example.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),

            Container(
              width: 450,
              padding: EdgeInsets.fromLTRB(20, 180, 20, 0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  maxLines: 2,
                  name,
                  style: TextStyle(
                    fontSize: 22,
                    height: 0.9,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF4F6F52),
                  ),
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.fromLTRB(140, 100, 20, 0),
              child: Align(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    text: (date),
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
            ),

            Container(
              margin: EdgeInsets.fromLTRB(140, 65, 0, 0),
              width: 75,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: severityColor.withAlpha(10),
              ),
            ),

            Container(
              margin: EdgeInsets.fromLTRB(150, 65, 0, 0),
              child: Text(
                severity!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: severityColor,
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.fromLTRB(250, 15, 0, 0),
              width: 100,
              height: 100,
              child: PieChart(
                PieChartData(
                  startDegreeOffset: 360,
                  sections: [
                    PieChartSectionData(
                      value: 100 - confidence!,
                      radius: 15,
                      showTitle: false,
                      color: Colors.grey,
                    ),
                    PieChartSectionData(
                      value: confidence,
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
              margin: EdgeInsets.fromLTRB(270, 48, 20, 0),
              child: RichText(
                text: TextSpan(
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
              margin: EdgeInsets.fromLTRB(270, 60, 20, 0),
              child: RichText(
                text: TextSpan(
                  text: ('${(confidence ?? 0.0).toStringAsFixed(1)}%'),
                  style: TextStyle(
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

      ///4. Diagnostic Result
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
                    offset: Offset(0, 4),
                  ),
                ],
              ),
            ),

            Container(
              width: 370,
              height: 280,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFFF9FAF8),
              ),
            ),

            Container(
              margin: EdgeInsets.fromLTRB(25, 18, 0, 0),
              width: isFromScanner ? 140 : 300,
              height: 140,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imagePath != null
                      ? FileImage(File(imagePath!)) as ImageProvider
                      : const AssetImage('lib/views/assets/example.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),

            Container(
              width: 450,
              padding: EdgeInsets.fromLTRB(20, 180, 20, 0),
              child: Align(
                alignment: Alignment.center,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    maxLines: 2,
                    name,
                    style: TextStyle(
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
                padding: EdgeInsets.fromLTRB(20, 250, 20, 0),
                child: Align(
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                      text: (date),
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
              ),

            Container(
              margin: EdgeInsets.fromLTRB(176, 210, 0, 0),
              width: 105,
              height: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: severityColor.withAlpha(10),
              ),
            ),

            Container(
              margin: EdgeInsets.fromLTRB(185, 210, 0, 0),
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
              margin: EdgeInsets.fromLTRB(90, 210, 0, 0),
              child: Text(
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
                margin: EdgeInsets.fromLTRB(190, 15, 0, 0),
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
                padding: EdgeInsets.fromLTRB(215, 60, 20, 0),
                child: RichText(
                  text: TextSpan(
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
                padding: EdgeInsets.fromLTRB(215, 80, 20, 0),
                child: RichText(
                  text: TextSpan(
                    text: ('${confidence!.toStringAsFixed(2)}%'),
                    style: TextStyle(
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
