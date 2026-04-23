import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
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

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 165,
                  height: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                      color: Colors.grey
                  ),
                ),


                Container(
                  width: 160,
                  height: 170,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey
                  ),
                )

              ],
            ),
          ],
        ),
      ),
    );
  }
}
