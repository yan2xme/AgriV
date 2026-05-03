import 'package:flutter/material.dart';
import '../models/disease_model.dart';
import 'components/disease_card.dart';
import 'package:tab_container/tab_container.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'assets/icons/agri_v_icons_icons.dart';
import 'chat_view.dart'; // Fixed import path to match standard

class DiagnosticResult extends StatelessWidget {
  const DiagnosticResult({
    super.key,
    this.isFromScanner = true,
    this.imagePath,
    this.detectedDiseaseId,
    this.confidenceLevel,
    this.disease,
    this.scanDate,
  });

  final bool isFromScanner;
  final String? imagePath;
  final String? detectedDiseaseId;
  final double? confidenceLevel;
  final DiseaseModel? disease;
  final String? scanDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Added the Ryzen background color so it isn't pure white
      backgroundColor: const Color(0xFFF0F0F0),
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: const Color(0xFFF0F0F0),
        centerTitle: true,
        elevation: 0, // Keep it flat
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF4F6F52)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          isFromScanner ? 'Diagnostic Result' : 'Disease Info',
          style: const TextStyle(
            height: 1,
            fontFamily: 'Space Grotesk',
            fontWeight: FontWeight.w800,
            color: Color(0xFF4F6F52),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
                // Ensure we only navigate if we have a valid disease
                if (disease != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatView(
                        diseaseName: disease!.name,
                        diseaseDescription: disease!.description,
                        imagePath: imagePath,
                      ),
                    ),
                  );
                }
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.smart_toy_outlined,
                  color: Color(0xFF4F6F52),
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          children: <Widget>[
            DiseaseCard(
              imagePath: imagePath,
              isFromScanner: isFromScanner,
              name: disease?.name ?? detectedDiseaseId ?? 'Unknown Disease',
              severity: disease?.severity,
              layoutType: CardType.diagnosticResult,
              confidence: confidenceLevel ?? 0.0,
              date: scanDate ?? 'No Date', // The magic happens here!
            ),

            // THE FIX: Wrapped in Expanded to prevent unbounded height crash!
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 20.0),
                child: TabContainer(
                  tabEdge: TabEdge.top,
                  tabsStart: 0.0,
                  tabsEnd: 1,
                  tabMaxLength: 200,
                  borderRadius: BorderRadius.circular(30),
                  tabBorderRadius: BorderRadius.circular(30),
                  childPadding: const EdgeInsets.all(16.0),
                  selectedTextStyle: const TextStyle(
                    color: Color(0xFF4F6F52),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Space Grotesk',
                    fontSize: 16.0,
                  ),
                  unselectedTextStyle: const TextStyle(
                    color: Color(0xFF757776),
                    fontFamily: 'Space Grotesk',
                    fontSize: 14.0,
                  ),
                  colors: const [Colors.white, Colors.white, Colors.white],
                  tabs: const [
                    Text('Description'),
                    Text('Treatments'),
                    Text('Prevention'),
                  ],
                  children: [
                    // Description Tab
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: ListView(
                        padding: const EdgeInsets.all(10),
                        children: [
                          Text(
                            disease?.description ?? 'No description available',
                            style: const TextStyle(
                              color: Colors.black87,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Treatments Tab
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: ListView(
                        padding: const EdgeInsets.all(10),
                        children: [
                          TimelineTile(
                            isFirst: true,
                            indicatorStyle: IndicatorStyle(
                              iconStyle: IconStyle(
                                iconData: AgriVIcons.group,
                                color: const Color(0xFF4F6F52),
                              ),
                              color: const Color(0xFF9FFFBD),
                              padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                              width: 40,
                            ),
                            endChild: Padding(
                              padding: const EdgeInsets.only(left: 16.0, bottom: 24.0, top: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Immediate Action',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xFF4F6F52),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    disease?.treatments.immediateAction ?? 'No immediate action available',
                                    style: const TextStyle(
                                      fontSize: 13,
                                      height: 1.4,
                                      fontFamily: 'Space Grotesk',
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF757776),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          TimelineTile(
                            indicatorStyle: IndicatorStyle(
                              iconStyle: IconStyle(
                                iconData: AgriVIcons.icon,
                                color: const Color(0xFF4F6F52),
                              ),
                              color: const Color(0xFF9FFFBD),
                              padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                              width: 40,
                            ),
                            endChild: Padding(
                              padding: const EdgeInsets.only(left: 16.0, bottom: 24.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Organic',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xFF4F6F52),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    disease?.treatments.organic ?? 'No organic available',
                                    style: const TextStyle(
                                      fontSize: 13,
                                      height: 1.4,
                                      fontFamily: 'Space Grotesk',
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF757776),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          TimelineTile(
                            indicatorStyle: IndicatorStyle(
                              iconStyle: IconStyle(
                                iconData: AgriVIcons.flask_icon_1,
                                color: const Color(0xFF4F6F52),
                              ),
                              color: const Color(0xFF9FFFBD),
                              padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                              width: 40,
                            ),
                            endChild: Padding(
                              padding: const EdgeInsets.only(left: 16.0, bottom: 24.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Chemical',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xFF4F6F52),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    disease?.treatments.chemical ?? 'No chemical available',
                                    style: const TextStyle(
                                      fontSize: 13,
                                      height: 1.4,
                                      fontFamily: 'Space Grotesk',
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF757776),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          TimelineTile(
                            isLast: true,
                            indicatorStyle: IndicatorStyle(
                              iconStyle: IconStyle(
                                iconData: AgriVIcons.icon__1_,
                                color: const Color(0xFF4F6F52),
                              ),
                              color: const Color(0xFF9FFFBD),
                              padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                              width: 40,
                            ),
                            endChild: Padding(
                              padding: const EdgeInsets.only(left: 16.0, bottom: 24.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Biological',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xFF4F6F52),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    disease?.treatments.biological ?? 'No biological available',
                                    style: const TextStyle(
                                      fontSize: 13,
                                      height: 1.4,
                                      fontFamily: 'Space Grotesk',
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF757776),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Prevention Tab
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: ListView(
                        padding: const EdgeInsets.all(10),
                        children: [
                          Text(
                            disease?.prevention ?? 'No prevention available',
                            style: const TextStyle(
                              color: Colors.black87,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}