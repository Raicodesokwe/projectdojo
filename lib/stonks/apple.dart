import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:projectdojo/services/bigtoggle.dart';


class AppleStock extends StatefulWidget {
  @override
  _AppleStockState createState() => _AppleStockState();
}

class _AppleStockState extends State<AppleStock> {
  int _toggleValue = 0;
  @override
  Widget build(BuildContext context) {
    Color greenColor = const Color(0xFF00AF19);
    final List<Color> gradientColors = [
      const Color(0xff23b6e6),
      const Color(0xff02d39a),
      const Color(0xFF00AF19),
    ];
    final numberFormat = new NumberFormat("##,###.00#", "en_US");
    final TextStyle cardNumberStyle =
        GoogleFonts.openSans(fontSize: 18, fontWeight: FontWeight.w600);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  //  boxShadow: [
                  //       BoxShadow(
                  //           blurRadius: 2,
                  //           spreadRadius: 2,
                  //           color: Colors.black87.withOpacity(0.2))
                  //     ],
                  color: Colors.greenAccent.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10.0)),
              child: Icon(
                Icons.more_vert,
                color: Colors.green[300],
              ),
            ),
          )
        ],
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                //  boxShadow: [
                //       BoxShadow(
                //           blurRadius: 2,
                //           spreadRadius: 2,
                //           color: Colors.black87.withOpacity(0.2))
                //     ],
                color: Colors.greenAccent.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10.0)),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                FontAwesomeIcons.arrowLeft,
                color: Colors.black,
                // color: Theme.of(context).iconTheme,
              ),
            ),
          ),
        ),
        title: Align(
          alignment: Alignment.center,
          child: Text(
            'Apple',
            style: GoogleFonts.spartan(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Theme.of(context).textTheme.headline6.color),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: Text(r'ksh' + "${numberFormat.format(27802.05)}",
                      style: cardNumberStyle.copyWith(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      )),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "15%",
                      style: GoogleFonts.spartan(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.green[300],
                      ),
                    ),
                    Icon(
                      FontAwesomeIcons.arrowCircleUp,
                      color: Colors.green[300],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                BigToggle(
                  values: ['Buy', 'Sell'],
                  onToggleCallback: (value) {
                    setState(() {
                      _toggleValue = value;
                    });
                  },
                  buttonColor: const Color(0xFF0A3157),
                  backgroundColor: Colors.greenAccent.withOpacity(0.3),
                  textColor: const Color(0xFFFFFFFF),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                  height: 300,
                  child: LineChart(LineChartData(
                      lineTouchData: LineTouchData(
                        handleBuiltInTouches: true,
                        touchCallback: (LineTouchResponse touchResponse) {},
                        enabled: false,
                      ),
                      minX: 0,
                      maxX: 11,
                      minY: 0,
                      maxY: 6,
                      gridData: FlGridData(show: false),
                      titlesData: FlTitlesData(show: false),
                      borderData: FlBorderData(show: false),
                      lineBarsData: [
                        LineChartBarData(
                            isCurved: true,
                            colors: gradientColors,
                            barWidth: 5,
                            dotData: FlDotData(show: false),
                            belowBarData: BarAreaData(
                                show: true,
                                colors: gradientColors
                                    .map((color) => color.withOpacity(0.3))
                                    .toList()),
                            spots: [
                              FlSpot(0, 3),
                              FlSpot(2.6, 2),
                              FlSpot(4.9, 5),
                              FlSpot(6.8, 2.5),
                              FlSpot(8, 4),
                              FlSpot(9.5, 3),
                              FlSpot(11, 4)
                            ])
                      ])),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                  child: Container(
                    height: 50.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.greenAccent,
                      color: greenColor,
                      elevation: 7.0,
                      child: Center(
                        child: const Text(
                          'Buy',
                          style: const TextStyle(
                              color: Colors.white, fontFamily: 'Trueno'),
                        ),
                      ),
                    ),
                    //materialapp widget is a wrapper of other flutter widgets
                    //material widget clips to a shape
                    //it elevates its widget subtree along z axis
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recommended for you',
                        style: GoogleFonts.spartan(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Theme.of(context).textTheme.headline6.color),
                      ),
                      Text(
                        'See all',
                        style: GoogleFonts.spartan(
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                            color: Theme.of(context).textTheme.headline6.color),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 60.0,
                          width: 60.0,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                const Color(0xffE0ABF2),
                                greenColor
                              ]),
                              borderRadius: BorderRadius.circular(18.0)),
                          child: Center(child: Icon(FontAwesomeIcons.amazon))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 60.0,
                          width: 60.0,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                const Color(0xff23b6e6),
                                const Color(0xff02d39a),
                                const Color(0xFFFEC18A)
                              ]),
                              borderRadius: BorderRadius.circular(18.0)),
                          child:
                              Center(child: Icon(FontAwesomeIcons.snapchat))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 60.0,
                          width: 60.0,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.pinkAccent, greenColor]),
                              borderRadius: BorderRadius.circular(18.0)),
                          child: Center(child: Icon(FontAwesomeIcons.paypal))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 60.0,
                          width: 60.0,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Colors.redAccent,
                                const Color(0xff23b6e6),
                                const Color(0xff02d39a),
                              ]),
                              borderRadius: BorderRadius.circular(18.0)),
                          child: Center(child: Icon(FontAwesomeIcons.google))),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
