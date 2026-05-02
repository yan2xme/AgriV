import 'package:flutter/material.dart';
import '../viewsmodels/scanner_viewmodel.dart';
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

          // Replace your bottom Container with this:
          Container(
            padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
            width: double.maxFinite,
            height: 442,
            child: ScannerViewModel.scanHistory.isEmpty
                ? const Center(
                    child: Text(
                      'Wala pang na-scan.',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  )
                : ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: ScannerViewModel.scanHistory.length,
                    itemBuilder: (context, index) {
                      // Get the specific disease from our history list
                      final disease = ScannerViewModel.scanHistory[index];

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DiagnosticResult(
                                  isFromScanner: false,
                                  disease: disease,
                                ),
                              ),
                            );
                          },
                          child: DiseaseCard(
                            name: disease.name,
                            date: 'Recently Scanned',
                            // Fake date for the demo
                            severity: disease.severity,
                            layoutType: CardType.historyPage,
                            confidence:
                                95.0, // Hardcoded for the demo, or use your var
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
