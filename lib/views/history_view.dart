import 'package:flutter/material.dart';
import '../viewsmodels/scanner_viewmodel.dart';
import 'components/disease_card.dart';
import 'diagnostic_result.dart';
import '../models/disease_model.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  // Method to clear the history with a confirmation dialog
  void _confirmClearHistory() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(
              color: Color(0xFF4F6F52),
              width: 2,
            ), // Neo-brutalist border
          ),
          title: const Text(
            'Clear History?',
            style: TextStyle(
              fontFamily: 'Space Grotesk',
              fontWeight: FontWeight.bold,
              color: Color(0xFF4F6F52),
            ),
          ),
          content: const Text(
            'Sigurado ka ba na gusto mong burahin lahat ng diagnostic logs? Hindi na ito maibabalik.',
            style: TextStyle(
              fontFamily: 'Space Grotesk',
              fontWeight: FontWeight.w500,
              color: Color(0xFF757776),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Space Grotesk',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFCC0000), // Danger Red
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () async {
                // 🛠️ MAKE THIS ASYNC

                // 🛠️ THE FIX: Wipe both RAM and Disk!
                await ScannerViewModel.clearAllHistory();

                setState(() {}); // Force the screen to refresh

                if (context.mounted) {
                  Navigator.pop(context); // Close dialog
                }
              },
              child: const Text(
                'Clear All',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Space Grotesk',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0),
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: const Color(0xFFF0F0F0),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF4F6F52)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Image.asset(
          'lib/views/assets/logo.png',
          fit: BoxFit.contain,
          height: 32,
        ),
        centerTitle: true,
        actions: [
          // Only show the trash icon if there is history to delete!
          if (ScannerViewModel.scanHistoryMap.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                icon: const Icon(
                  Icons.delete_outline,
                  color: Color(0xFFCC0000),
                  size: 28,
                ),
                onPressed: _confirmClearHistory,
              ),
            ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: const Stack(
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

          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              width: double.maxFinite,
              child: ScannerViewModel.scanHistoryMap.isEmpty
                  ? const Center(
                      child: Text(
                        'Wala pang na-scan.',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontFamily: 'Space Grotesk',
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: ScannerViewModel.scanHistoryMap.length,
                      itemBuilder: (context, index) {
                        final reversedIndex =
                            (ScannerViewModel.scanHistoryMap.length - 1) -
                            index;
                        final historyEntry = ScannerViewModel
                            .scanHistoryMap
                            .values
                            .elementAt(reversedIndex);

                        final disease = historyEntry['disease'] as DiseaseModel;
                        final scanDate = historyEntry['date'] as String;
                        final confidence = historyEntry['confidence'] as double;
                        final imagePath = historyEntry['imagePath'] as String;

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
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
                              layoutType: CardType.historyPage,
                              confidence: confidence,
                              imagePath: imagePath,
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
