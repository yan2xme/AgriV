import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';
import 'components/disease_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('lib/views/assets/bgFarm.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.all(90),
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
                  padding: EdgeInsets.fromLTRB(23, 100, 20, 0),
                  child: StrokeText(
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
                  padding: EdgeInsets.fromLTRB(25, 210, 20, 0),
                  child: Text(
                    "Tara na't magscan ng mga pananim!",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),

                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    margin: EdgeInsets.only(top: 60),
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/views/assets/carabaoFarmer.png'),
                      ),
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 80,
                    width: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/views/assets/logo.png'),
                      ),
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.fromLTRB(25, 80, 20, 0),
                  child: StrokeText(
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
                  padding: EdgeInsets.fromLTRB(25, 120, 20, 0),
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
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
                  Container(
                    width: 165,
                    height: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFFF2F2F2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xFFCBFFDD),
                            ),
                            width: 45,
                            height: 45,
                          ),

                          Container(
                            height: 30,
                            width: 30,
                            margin: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('lib/views/assets/scan.png'),
                              ),
                            ),
                          ),

                          Container(
                            padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                            child: Text(
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
                            padding: EdgeInsets.fromLTRB(0, 115, 0, 0),
                            width: 80,
                            child: RichText(
                              text: TextSpan(
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

                  Container(
                    width: 165,
                    height: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFFF2F2F2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xFFCBFFDD),
                            ),
                            width: 45,
                            height: 45,
                          ),

                          Container(
                            height: 30,
                            width: 30,
                            margin: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  'lib/views/assets/gallery.png',
                                ),
                              ),
                            ),
                          ),

                          Container(
                            padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                            child: Text(
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
                            padding: EdgeInsets.fromLTRB(0, 115, 0, 0),
                            width: 80,
                            child: RichText(
                              text: TextSpan(
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
                ],
              ),
            ),

            ///lower body
            Padding(
              padding: EdgeInsetsGeometry.all(20),

              ///Mga nakaraang na-diagnose and VIEW ALL header
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: 200,
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

                  Text(
                    'View All',
                    style: TextStyle(
                      fontFamily: 'Space Grotesk',
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF4F6F52),
                    ),
                  )

                ],
              ),
            ),

            Container(
              padding: EdgeInsets.fromLTRB(20,0,20,0),
              width: double.infinity,
              height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    DiseaseCard(name: 'Banana Sigatoka', date: '2hrs Ago', severity: 'HIGH RISK'),
                    SizedBox(width: 12,),
                    DiseaseCard(name: 'Banana Sigatoka', date: '2hrs Ago', severity: 'HIGH RISK'),
                    SizedBox(width: 12,),
                    DiseaseCard(name: 'Banana Sigatoka', date: '2hrs Ago', severity: 'HIGH RISK')
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
