import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:projectdojo/alpaca/account.dart';
import 'package:projectdojo/alpaca/trading.dart';

import 'package:projectdojo/services/investtoggle.dart';
import 'package:projectdojo/stocko/searchdel.dart';
import 'package:projectdojo/stonks/apple.dart';
import 'package:projectdojo/stonks/search.dart';

class StockInvestments extends StatefulWidget {
  @override
  _StockInvestmentsState createState() => _StockInvestmentsState();
}

class _StockInvestmentsState extends State<StockInvestments> {
  int _toggleValue = 0;
  Future hono;
  Future takwe;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hono = TradingService().getAccount(context);
    takwe=TradingService().getPositions(context);
  }

  @override
  Widget build(BuildContext context) {
    Color greenColor = const Color(0xFF00AF19);
    Size size = MediaQuery.of(context).size;
    final numberFormat = new NumberFormat("##,###.00#", "en_US");
    final TextStyle cardNumberStyle =
        GoogleFonts.openSans(fontSize: 18, fontWeight: FontWeight.w600);
    final TextStyle cardTextStyle =
        GoogleFonts.spartan(color: Colors.black, fontWeight: FontWeight.w600);
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<Account>(
          future: hono,
          builder: (context, snapshot) {
             if (snapshot.hasError) {
                return Center(
                  child: Lottie.asset("assets/fofoerror.json",
                      height: size.height * 0.5),
                );
              } else if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator(),);
              }
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  const Color(0xff23b6e6),
                  const Color(0xff02d39a),
                  const Color(0xFFFEC18A)
                ]),
              ),
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    // pinned: false,
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    expandedHeight: size.height * 0.54,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Stack(children: [
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              const Color(0xff23b6e6),
                              const Color(0xff02d39a),
                              const Color(0xFFFEC18A)
                            ]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(23.0),
                          child: Column(
                            children: [
                              Container(
                                  // alignment: FractionalOffset.center,
        
                                  height: 200,
                                  width: 400,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(
                                          color: Colors.black.withOpacity(0.1),
                                          width: 2.0),
                                      color: Colors.grey[100].withOpacity(0.5)),
                                  child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Buying power',
                                                  style: cardTextStyle.copyWith(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.w600),
                                                ),
                                                SizedBox(
                                                  height: size.height * 0.025,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                        r'$' +
                                                            "${numberFormat.format(double.parse(snapshot.data.buyingPower))}",
                                                        style: cardNumberStyle
                                                            .copyWith(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight.w600,
                                                                color:
                                                                    Colors.black)),
                                                                    SizedBox(width: size.width * 0.03,),
                                                    Container(
                                                      width: 85,
                                                      child: Stack(
                                                        children: [
                                                          Container(
                                                              height: 54.0,
                                                              width: 54.0,
                                                              decoration: BoxDecoration(
                                                                  gradient:
                                                                      LinearGradient(
                                                                          colors: [
                                                                        const Color(
                                                                            0xff23b6e6),
                                                                        const Color(
                                                                            0xff02d39a),
                                                                        const Color(
                                                                            0xFFFEC18A)
                                                                      ]),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              18.0)),
                                                              child: Center(
                                                                child: Icon(
                                                                    FontAwesomeIcons
                                                                        .apple),
                                                              )),
                                                          Positioned(
                                                            left: 30,
                                                            child: Container(
                                                                height: 54.0,
                                                                width: 54.0,
                                                                decoration: BoxDecoration(
                                                                    gradient:
                                                                        LinearGradient(
                                                                            colors: [
                                                                          const Color(
                                                                              0xffE0ABF2),
                                                                          greenColor
                                                                        ]),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                18.0)),
                                                                child: Center(
                                                                    child: Icon(
                                                                        FontAwesomeIcons
                                                                            .amazon))),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                                                  Text(
                                                  'Market Value',
                                                  style: cardTextStyle.copyWith(
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w600),
                                                ),
                                                SizedBox(
                                                  height: size.height*0.01,
                                                ),
                                                 Text(
                                                        r'$' +
                                                            "${numberFormat.format(double.parse(snapshot.data.longMarketValue))}",
                                                        style: cardNumberStyle
                                                            .copyWith(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight.w600,
                                                                color:
                                                                    Colors.black)),
                                                ],)
                                              ],
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  children: [
                                                    const SizedBox(
                                                      height: 80.0,
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
                                          ]))),
                              const SizedBox(
                                height: 10,
                              ),
                              AnimatedToggle(
                                values: ['My', 'Popular'],
                                onToggleCallback: (value) {
                                  setState(() {
                                    _toggleValue = value;
                                  });
                                },
                                buttonColor: const Color(0xFF0A3157),
                                backgroundColor: Colors.grey[100].withOpacity(0.5),
                                textColor: const Color(0xFFFFFFFF),
                              ),
                              // Container(
                              //   height: 50,
                              //   width: 300,
                              //   decoration: BoxDecoration(
                              //     color: Colors.grey[100].withOpacity(0.5),
                              //     borderRadius: BorderRadius.all(Radius.circular(30))
                              //   ),
        
                              // )
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ),
                  SliverList(
                      delegate: SliverChildListDelegate([
                    Container(
                      height: 800,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        // color: Theme.of(context).scaffoldBackgroundColor,
                        color: Colors.grey[100].withOpacity(0.5),
                        // color: Colors.red,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0)),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            FontAwesomeIcons.windowMinimize,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 8.0, top: 8.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => SearchStonk()));
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 4),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                              height: 54.0,
                                              width: 54.0,
                                              decoration: BoxDecoration(
                                                  gradient: LinearGradient(colors: [
                                                    const Color(0xff23b6e6),
                                                    const Color(0xff02d39a),
                                                    const Color(0xFFFEC18A)
                                                  ]),
                                                  borderRadius:
                                                      BorderRadius.circular(18.0)),
                                              child: Center(
                                                  child: Icon(
                                                      FontAwesomeIcons.apple))),
                                        ),
                                        const SizedBox(
                                          width: 10.0,
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              'Apple Inc',
                                              style: GoogleFonts.bigShouldersText(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                            Text(
                                              'AAPL',
                                              style: TextStyle(
                                                  fontFamily: 'Lato',
                                                  fontWeight: FontWeight.w100,
                                                  fontSize: 15),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Text(
                                              r'ksh' +
                                                  "${numberFormat.format(27802.05)}",
                                              style: cardNumberStyle.copyWith(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                              )),
                                          Row(
                                            children: [
                                              Text(
                                                "15%",
                                                style: GoogleFonts.spartan(
                                                  fontSize: 12,
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
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 8.0, top: 5.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => AppleStock()));
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 4),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                              height: 54.0,
                                              width: 54.0,
                                              decoration: BoxDecoration(
                                                  gradient: LinearGradient(colors: [
                                                    const Color(0xffE0ABF2),
                                                    greenColor
                                                  ]),
                                                  borderRadius:
                                                      BorderRadius.circular(18.0)),
                                              child: Center(
                                                  child: Icon(
                                                      FontAwesomeIcons.amazon))),
                                        ),
                                        const SizedBox(
                                          width: 10.0,
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              'Amazon Inc',
                                              style: GoogleFonts.bigShouldersText(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                            Text(
                                              'AMZN',
                                              style: TextStyle(
                                                  fontFamily: 'Lato',
                                                  fontWeight: FontWeight.w100,
                                                  fontSize: 15),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Text(
                                              r'ksh' +
                                                  "${numberFormat.format(27802.05)}",
                                              style: cardNumberStyle.copyWith(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                              )),
                                          Row(
                                            children: [
                                              Text(
                                                "15%",
                                                style: GoogleFonts.spartan(
                                                  fontSize: 12,
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
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 8.0, top: 5.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 4),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                            height: 54.0,
                                            width: 54.0,
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(colors: [
                                                  Colors.redAccent,
                                                  const Color(0xff23b6e6),
                                                  const Color(0xff02d39a),
                                                ]),
                                                borderRadius:
                                                    BorderRadius.circular(18.0)),
                                            child: Center(
                                                child:
                                                    Icon(FontAwesomeIcons.google))),
                                      ),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            'Alphabet',
                                            style: GoogleFonts.bigShouldersText(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                          Text(
                                            'GOOG',
                                            style: TextStyle(
                                                fontFamily: 'Lato',
                                                fontWeight: FontWeight.w100,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(
                                            r'ksh' +
                                                "${numberFormat.format(27802.05)}",
                                            style: cardNumberStyle.copyWith(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            )),
                                        Row(
                                          children: [
                                            Text(
                                              "15%",
                                              style: GoogleFonts.spartan(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.red[300],
                                              ),
                                            ),
                                            Icon(
                                              FontAwesomeIcons.arrowCircleDown,
                                              color: Colors.red[300],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 8.0, top: 5.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 4),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                            height: 54.0,
                                            width: 54.0,
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(colors: [
                                                  Colors.pinkAccent,
                                                  greenColor
                                                ]),
                                                borderRadius:
                                                    BorderRadius.circular(18.0)),
                                            child: Center(
                                                child:
                                                    Icon(FontAwesomeIcons.paypal))),
                                      ),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            'PayPal',
                                            style: GoogleFonts.bigShouldersText(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                          Text(
                                            'PYPL',
                                            style: TextStyle(
                                                fontFamily: 'Lato',
                                                fontWeight: FontWeight.w100,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(
                                            r'ksh' +
                                                "${numberFormat.format(27802.05)}",
                                            style: cardNumberStyle.copyWith(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            )),
                                        Row(
                                          children: [
                                            Text(
                                              "15%",
                                              style: GoogleFonts.spartan(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.red[300],
                                              ),
                                            ),
                                            Icon(
                                              FontAwesomeIcons.arrowCircleDown,
                                              color: Colors.red[300],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ]))
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
