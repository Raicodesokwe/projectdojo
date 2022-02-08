import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter/widgets.dart';
import 'package:projectdojo/History/accountactivity.dart';
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
                               
                                ],
                              )
                            ])),
                  ),
                  SizedBox(height: size.height * 0.025,),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => StockInvestments()));
                    },
                    child: ListTile(leading:  Container(
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
                                  )),title:  Text(
                                'Stock investments',
                                style: GoogleFonts.prompt(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),trailing: Text(r'ksh' + "${numberFormat.format(27802.05)}",
                              style: cardNumberStyle.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              )),)
                    
                    
                  ),
                  SizedBox(height: size.height * 0.025,),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AccountActivities()));
                    },
                    child: ListTile(leading:  Container(
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
                                  )),title:  Text(
                                'Cryptocurrency investments',
                                style: GoogleFonts.prompt(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),trailing: Text(r'ksh' + "${numberFormat.format(27802.05)}",
                              style: cardNumberStyle.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              )),)
                  ),
                  SizedBox(height: size.height * 0.025,),
                  GestureDetector(
                     onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EquityInvestments()));
                    },
                    child:  ListTile(leading:  Container(
                                  height: 54.0,
                                  width: 54.0,
                                  decoration: BoxDecoration(
                                      color:
                                          Colors.greenAccent.withOpacity(0.3),
                                      borderRadius:
                                          BorderRadius.circular(18.0)),
                                  child: Center(
                                    child: Text('🤑',
                                        style: TextStyle(fontSize: 30)),
                                  )),title:  Text(
                                'Equity Crowdfunding',
                                style: GoogleFonts.prompt(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),trailing: Text(r'ksh' + "${numberFormat.format(27802.05)}",
                              style: cardNumberStyle.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              )),)
                  ),
                  SizedBox(height: size.height * 0.025,),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PropertyInvestments()));
                    },
                    child:ListTile(leading:  Container(
                                  height: 54.0,
                                  width: 54.0,
                                  decoration: BoxDecoration(
                                      color:
                                          Colors.greenAccent.withOpacity(0.3),
                                      borderRadius:
                                          BorderRadius.circular(18.0)),
                                  child: Center(
                                    child: Text('💸',
                                        style: TextStyle(fontSize: 30)),
                                  )),title:  Text(
                                'Property Crowdfunding',
                                style: GoogleFonts.prompt(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),trailing: Text(r'ksh' + "${numberFormat.format(27802.05)}",
                              style: cardNumberStyle.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              )),
                              
                              )
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
