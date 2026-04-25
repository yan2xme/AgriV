import 'package:flutter/material.dart';
import 'components/disease_card.dart';

class DiagnosticResult extends StatelessWidget {
  const DiagnosticResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Color(0xFFF0F0F0),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Diagnostic Result',
              style: TextStyle(
                height: 1,
                fontFamily: 'Space Grotesk',
                fontWeight: FontWeight.w800,
                color: Color(0xFF4F6F52),
              ),
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: DiseaseCard(
            name: 'Banana Sigatoka',
            description:
            'Lorem ipsum ditum sit dolor ametahaha Lorem ipsum ditum sit dolor ametahaha tabang mga langit please Lorem ipsum ditum sit dolor amet ahaha tabang mga langit please ',
            severity: 'HIGH RISK',
            layoutType: CardType.diagnosticResult,
            confidence: 67.69,
            date: 'Aug 8, 2026 9:11 AM',
          ),
        ),
      ),
    );
  }
}
