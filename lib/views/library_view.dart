import 'package:flutter/material.dart';

import 'components/disease_card.dart';

class LibraryView extends StatelessWidget{
  const LibraryView ({super.key});

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

      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
            width: double.maxFinite,
            height: double.maxFinite,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                DiseaseCard(
                  name: 'Banana Sigatoka',
                  description: 'Lorem ipsum ditum sit dolor ametahaha Lorem ipsum ditum sit dolor ametahaha tabang mga langit please Lorem ipsum ditum sit dolor amet ahaha tabang mga langit please ',
                  severity: 'HIGH RISK',
                  layoutType: CardType.diseaseLibrary,
                  confidence: 67.69,),
                SizedBox(height: 12,),
                DiseaseCard(
                  name: 'Banana Sigatoka',
                  description: 'Lorem ipsum ditum sit dolor ametahaha Lorem ipsum ditum sit dolor ametahaha tabang mga langit please Lorem ipsum ditum sit dolor amet ahaha tabang mga langit please ',
                  severity: 'HIGH RISK',
                  layoutType: CardType.diseaseLibrary,
                  confidence: 67.69,),
                SizedBox(height: 12,)
              ],
            ),
          )

        ],
      ),
    );
  }
}

