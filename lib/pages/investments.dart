import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter/widgets.dart';
import 'package:projectdojo/investamodelo/cryptoinvestments.dart';
import 'package:projectdojo/investamodelo/equityinvestments.dart';
import 'package:projectdojo/investamodelo/propertyinvestments.dart';
import 'package:projectdojo/investamodelo/stockinvestments.dart';

class Investments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final numberFormat = new NumberFormat("##,###.00#", "en_US");
    final TextStyle cardNumberStyle =
        GoogleFonts.openSans(fontSize: 18, fontWeight: FontWeight.w600);
    final TextStyle cardTextStyle =
        GoogleFonts.spartan(color: Colors.white, fontWeight: FontWeight.w600);

    final List<Color> gradientColors = [
      const Color(0xff23b6e6),
      const Color(0xff02d39a),
      const Color(0xFF00AF19),
    ];
    final BoxDecoration decorator = BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        border: Border.all(color: Colors.black.withOpacity(0.5), width: 4.0),
        gradient: const LinearGradient(colors: [
          const Color(0xff23b6e6),
          const Color(0xff02d39a),
          const Color(0xFFFEC18A)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight));
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                'Investments',
                style: GoogleFonts.spartan(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Theme.of(context).textTheme.headline6.color),
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: 200,
                    decoration: decorator.copyWith(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 2,
                            spreadRadius: 2,
                            color: Colors.black.withOpacity(0.2))
                      ],
                      borderRadius: BorderRadius.circular(30.0),
                      gradient: LinearGradient(colors: [
                        const Color(0xff23b6e6),
                        const Color(0xff02d39a),
                        const Color(0xFFFEC18A)
                      ]),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Total Investments',
                                    style: cardTextStyle.copyWith(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  //   children: [
                                  Text(
                                      r'ksh' +
                                          "${numberFormat.format(27802.05)}",
                                      style: cardNumberStyle.copyWith(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      )),
                                  // SizedBox(width: 40,),
                                  //     Container(
                                  //   width: 100,
                                  //   child:
                                  //   Stack(
                                  //     children: [
                                  //       Container(
                                  //           height: 54.0,
                                  //           width: 54.0,
                                  //           decoration: BoxDecoration(
                                  //               color: Colors.greenAccent
                                  //                   .withOpacity(0.3),
                                  //               borderRadius:
                                  //                   BorderRadius.circular(
                                  //                       18.0)),
                                  //           child:  Image.asset("assets/apple.png",alignment: Alignment.center,)
                                  //           ),
                                  //       Positioned(
                                  //         left: 40,
                                  //         child: Container(
                                  //             height: 54.0,
                                  //             width: 54.0,
                                  //             decoration: BoxDecoration(
                                  //                 color: Colors.greenAccent
                                  //                     .withOpacity(0.3),
                                  //                 borderRadius:
                                  //                     BorderRadius.circular(
                                  //                         18.0)),
                                  //             child: Center(
                                  //               child: Text('🚀',
                                  //                   style: TextStyle(
                                  //                       fontSize: 30)),
                                  //             )),
                                  //       ),
                                  //       // Container(
                                  //       //     height: 54.0,
                                  //       //     width: 54.0,
                                  //       //     decoration: BoxDecoration(
                                  //       //         color: Colors.greenAccent
                                  //       //             .withOpacity(0.3),
                                  //       //         borderRadius:
                                  //       //             BorderRadius.circular(
                                  //       //                 18.0)),
                                  //       //     child: Center(
                                  //       //       child: Text('🚀',
                                  //       //           style: TextStyle(
                                  //       //               fontSize: 30)),
                                  //       //     )),
                                  //     ],
                                  //   ),
                                  // ),
                                  //   ],
                                  // ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      const SizedBox(
                                        height: 130.0,
                                      ),
                                      Text(
                                        "15%",
                                        style: GoogleFonts.spartan(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_upward,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        'Dojo',
                                        style: TextStyle(
                                            fontFamily: 'Trueno',
                                            fontSize: 25.0,
                                            color: Colors.white),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.01,
                                      ),
                                      Container(
                                          height: 4.0,
                                          width: 4.0,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.black))
                                    ],
                                  ),
                                ],
                              )
                            ])),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => StockInvestments()));
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  height: 54.0,
                                  width: 54.0,
                                  decoration: BoxDecoration(
                                      color:
                                          Colors.greenAccent.withOpacity(0.3),
                                      borderRadius:
                                          BorderRadius.circular(18.0)),
                                  child: Center(
                                    child: Text('🚀',
                                        style: TextStyle(fontSize: 30)),
                                  )),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                'Stock investments',
                                style: GoogleFonts.bigShouldersText(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ],
                          ),
                          Text(r'ksh' + "${numberFormat.format(27802.05)}",
                              style: cardNumberStyle.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              )),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CryptoInvestments()));
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  height: 54.0,
                                  width: 54.0,
                                  decoration: BoxDecoration(
                                      color:
                                          Colors.greenAccent.withOpacity(0.3),
                                      borderRadius:
                                          BorderRadius.circular(18.0)),
                                  child: Center(
                                    child: Text('📈',
                                        style: TextStyle(fontSize: 30)),
                                  )),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Container(
                                width: 120.0,
                                child: Text(
                                  'Cryptocurrency investments',
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.bigShouldersText(
                                      fontWeight: FontWeight.bold, fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                          Text(r'ksh' + "${numberFormat.format(27802.05)}",
                              style: cardNumberStyle.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              )),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                     onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EquityInvestments()));
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  height: 54.0,
                                  width: 54.0,
                                  decoration: BoxDecoration(
                                      color: Colors.greenAccent.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(18.0)),
                                  child: Center(
                                    child: Text('🤑',
                                        style: TextStyle(fontSize: 28)),
                                  )),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                'Equity crowdfunding',
                                style: GoogleFonts.bigShouldersText(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ],
                          ),
                          Text(r'ksh' + "${numberFormat.format(27802.05)}",
                              style: cardNumberStyle.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              )),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PropertyInvestments()));
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  height: 54.0,
                                  width: 54.0,
                                  decoration: BoxDecoration(
                                      color: Colors.greenAccent.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(18.0)),
                                  child: Center(
                                    child: Text('💸',
                                        style: TextStyle(fontSize: 30)),
                                  )),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                'Property crowdfunding',
                                style: GoogleFonts.bigShouldersText(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ],
                          ),
                          Text(r'ksh' + "${numberFormat.format(27802.05)}",
                              style: cardNumberStyle.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              )),
                        ],
                      ),
                    ),
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
                ],
              ),
            ),
          )),
    );
  }
}
