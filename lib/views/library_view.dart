import 'package:flutter/material.dart';

import 'components/disease_card.dart';
import 'diagnostic_result.dart';

class LibraryView extends StatelessWidget {
  const LibraryView({super.key});

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
        children: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TextField(
                  // Just a visual dummy for now, no onChanged logic needed yet
                  decoration: InputDecoration(
                    hintText: 'Search diseases...',
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    prefixIcon: const Icon(Icons.search, color: Colors.green),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                ),
              ),
            ],
          ),

          Container(
            width: 372,
            height: 465.4,
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
                          isFromScanner: false, // <-- This turns off the scanner UI!
                        ),
                      ),
                    );
                  } ,
                  child:  DiseaseCard(
                    name: 'Banana Sigatoka',
                    description: 'Lorem ipsum ditum sit dolor ametahaha Lorem ipsum ditum sit dolor ametahaha tabang mga langit please Lorem ipsum ditum sit dolor amet ahaha tabang mga langit please ',
                    severity: 'HIGH RISK',
                    layoutType: CardType.diseaseLibrary,
                    confidence: 67.69,),
                ),
                SizedBox(height: 12,),
                GestureDetector(
                  onTap: () {
                    // Put this on your Library Card's onTap:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DiagnosticResult(
                          isFromScanner: false, // <-- This turns off the scanner UI!
                        ),
                      ),
                    );
                  } ,
                  child:  DiseaseCard(
                    name: 'Banana Sigatoka',
                    description: 'Lorem ipsum ditum sit dolor ametahaha Lorem ipsum ditum sit dolor ametahaha tabang mga langit please Lorem ipsum ditum sit dolor amet ahaha tabang mga langit please ',
                    severity: 'HIGH RISK',
                    layoutType: CardType.diseaseLibrary,
                    confidence: 67.69,),
                )
              ],
            ),
          )

        ],
      ),
    );
  }
}
