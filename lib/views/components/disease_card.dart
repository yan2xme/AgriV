import 'package:flutter/material.dart';

enum CardType{
  homePageRecent,
  diseaseLibrary,
  historyPage,
  diagnosticResult
}

class DiseaseCard extends StatelessWidget {
  final String name;
  final String? description;
  final String? date;
  final String? severity;
  final double? confidence;
  final CardType layoutType;

  const DiseaseCard({
    super.key,
    required this.name,
    required this.layoutType,

    this.date,
    this.severity,
    this.confidence,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
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
                  image: AssetImage('lib/views/assets/example.jpg'),
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
              margin: EdgeInsets.fromLTRB(120,10,0,0),
              width: 75,
              height: 20,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color(0xFFFFE1E1)
              ),
            ),

            Container(
              margin: EdgeInsets.fromLTRB(128,11,0,0),
              child: Text(severity!,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Color(0xFFCC0000)
                ),),
            )


          ],
        );



        ///2
      case CardType.diseaseLibrary:
        // TODO: Handle this case.
        throw UnimplementedError();
       
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
              margin: EdgeInsets.fromLTRB(18, 18, 0,0),
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
              width: 300,
              padding: EdgeInsets.fromLTRB(140, 20, 20, 0),
              child: Text(
                maxLines: 2,
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
              padding: EdgeInsets.fromLTRB(140, 100, 20, 0),
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
              margin: EdgeInsets.fromLTRB(140,65,0,0),
              width: 75,
              height: 20,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color(0xFFFFE1E1)
              ),
            ),

            Container(
              margin: EdgeInsets.fromLTRB(150,65,0,0),
              child: Text(severity!,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Color(0xFFCC0000)
                ),),
            )


          ],
        );




      case CardType.diagnosticResult:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }
}
