import 'package:flutter/material.dart';
import 'components/disease_card.dart';
import 'diagnostic_result.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Color(0xFFF0F0F0),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ('lib/views/assets/logo.png'),
              fit: BoxFit.contain,
              height: 32,
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Stack(
              children: <Widget>[
                Text(
                  'History',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4F6F52),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
                  child: Text(
                    'Mga Diagnostic Log',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF4F6F52),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
            width: double.maxFinite,
            height: 442,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                GestureDetector(
                  onTap: () {
                    // Put this on your Library Card's onTap:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DiagnosticResult(
                          isFromScanner:
                              true, // <-- This turns off the scanner UI!
                        ),
                      ),
                    );
                  },
                  child: DiseaseCard(
                    name: 'Banana Sigatoka',
                    date: '2hrs Ago',
                    severity: 'HIGH RISK',
                    layoutType: CardType.historyPage,
                    confidence: 67.69,
                  ),
                ),
                SizedBox(height: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
