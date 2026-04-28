import 'package:flutter/material.dart';
import 'components/disease_card.dart';
import 'package:tab_container/tab_container.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'assets/icons/agri_v_icons_icons.dart';

class DiagnosticResult extends StatelessWidget {
  const DiagnosticResult({super.key, this.isFromScanner = true});

  final bool isFromScanner;

  TabController? get _tabController => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Color(0xFFF0F0F0),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text( isFromScanner ?
              'Diagnostic Result' : 'Disease Info',
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

      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          children: <Widget>[
            DiseaseCard(
              isFromScanner: isFromScanner,
              name: 'Banana Sigatoka',
              description:
                  'Lorem ipsum ditum sit dolor ametahaha Lorem ipsum ditum sit dolor ametahaha tabang mga langit please Lorem ipsum ditum sit dolor amet ahaha tabang mga langit please ',
              severity: 'HIGH RISK',
              layoutType: CardType.diagnosticResult,
              confidence: 67.69,
              date: 'Aug 8, 2026 9:11 AM',
            ),

            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TabContainer(
                controller: _tabController,
                tabEdge: TabEdge.top,
                tabsStart: 0.0,
                tabsEnd: 1,
                tabMaxLength: 200,
                borderRadius: BorderRadius.circular(30),
                tabBorderRadius: BorderRadius.circular(30),
                childPadding: const EdgeInsets.all(10.0),
                selectedTextStyle: const TextStyle(
                  color: Color(0xFF4F6F52),
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
                unselectedTextStyle: const TextStyle(
                  color: Color(0xFF757776),
                  fontSize: 14.0,
                ),
                colors: [Colors.white, Colors.white, Colors.white],
                tabs: [
                  Text('Description'),
                  Text('Treatments'),
                  Text('Prevention'),
                ],
                children: [
                  //description
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    height: 229,
                    child: ListView(
                      padding: EdgeInsets.all(10),
                      children: [
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt "
                          "ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud"
                          "exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
                          "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur",
                        ),
                      ],
                    ),
                  ),

                  //treatments
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    height: 229,
                    child: ListView(
                      padding: EdgeInsets.all(10),
                      children: [
                        TimelineTile(
                          isFirst: true,
                          indicatorStyle: IndicatorStyle(
                            iconStyle: IconStyle(iconData: AgriVIcons.group,
                                color: Color(0xFF4F6F52)),
                            color: Color(0xFF9FFFBD) ,
                            padding: EdgeInsets.fromLTRB(8,2,8,2),
                            width: 40,
                          ),
                          endChild: Stack(
                            children: [
                              //immediate action
                              Container(
                                padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                                child: Text(
                                  maxLines: 2,
                                  'Immediate Action',
                                  style: TextStyle(
                                    fontSize: 20,
                                    height: 0.9,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xFF4F6F52),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(40, 20, 0, 0),
                                child: RichText(
                                  text: TextSpan(
                                    text:
                                        'Remove and properly dispose (burn or bury) '
                                        'infected banana leaves to stop the spread of the disease.',
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

                        //organic
                        TimelineTile(
                          indicatorStyle: IndicatorStyle(
                              iconStyle: IconStyle(iconData: AgriVIcons.icon,
                                  color: Color(0xFF4F6F52)),
                              color: Color(0xFF9FFFBD),
                              padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
                            width: 40,
                          ),
                          endChild: Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 40),
                                child: Text(
                                  maxLines: 2,
                                  'Organic',
                                  style: TextStyle(
                                    fontSize: 20,
                                    height: 0.9,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xFF4F6F52),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(40, 20, 0, 0),
                                child: RichText(
                                  text: TextSpan(
                                    text:
                                        'Use neem oil or compost tea sprays to help suppress fungal growth and strengthen plant resistance.',
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

                        //chemical
                        TimelineTile(
                          indicatorStyle: IndicatorStyle(
                              iconStyle: IconStyle(iconData: AgriVIcons.flask_icon_1,
                                  color: Color(0xFF4F6F52)),
                            color: Color(0xFF9FFFBD),
                            padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
                            width: 40,
                          ),
                          endChild: Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 40),
                                child: Text(
                                  maxLines: 2,
                                  'Chemical',
                                  style: TextStyle(
                                    fontSize: 20,
                                    height: 0.9,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xFF4F6F52),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(40, 20, 0, 0),
                                child: RichText(
                                  text: TextSpan(
                                    text:
                                        'Apply recommended fungicides such as mancozeb or chlorothalonil every 7–14 days,'
                                        'especially during rainy periods, following proper dosage and safety guidelines.',
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

                        //biological
                        TimelineTile(
                          isLast: true,
                          indicatorStyle: IndicatorStyle(
                              iconStyle: IconStyle(iconData: AgriVIcons.icon__1_,
                                  color: Color(0xFF4F6F52)),
                            color: Color(0xFF9FFFBD),
                            padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
                            width: 40,
                          ),
                          endChild: Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 40),
                                child: Text(
                                  maxLines: 2,
                                  'Biological',
                                  style: TextStyle(
                                    fontSize: 20,
                                    height: 0.9,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xFF4F6F52),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(40, 20, 0, 0),
                                child: RichText(
                                  text: TextSpan(
                                    text:
                                        'Introduce beneficial microorganisms like'
                                        'Trichoderma species that naturally fight the fungus causing the disease.',

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
                      ],
                    ),
                  ),

                  //prevention
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    height: 229,
                    child: ListView(padding: EdgeInsets.all(10), children: [
                      Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt "
                          "ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud"
                          "exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
                          "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur")
                    ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
