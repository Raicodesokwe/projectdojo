import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:projectdojo/History/clipper.dart';
import 'package:projectdojo/alpaca/activities.dart';
import 'package:projectdojo/alpaca/trading.dart';

import 'basebezier.dart';

class AccountActivities extends StatefulWidget {
  const AccountActivities({Key key, this.child}) : super(key: key);
  final Widget child;

  @override
  State<AccountActivities> createState() => _AccountActivitiesState();
}

class _AccountActivitiesState extends State<AccountActivities> {
  Future paque;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    paque = TradingService().getActivities(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Color greenColor = const Color(0xFF00AF19);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            ClipPath(
              clipper: MyClipper(),
              child: BaseBezier(
                size: size,
                greenColor: greenColor,
                child: Center(
                  child: Text('History',
                      style: TextStyle(
                          fontFamily: 'Trueno',
                          fontSize: 50,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            FutureBuilder(
                future: paque,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Lottie.asset("assets/fofoerror.json",
                          height: size.height * 0.5),
                    );
                  } else if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 8.0, top: 8.0),
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 4),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFEC18A),
                      //             gradient: LinearGradient(
                      // begin: Alignment.topLeft,
                      // end: Alignment.bottomCenter,
                      // colors: [
                      //   greenColor,
                      //   Colors.greenAccent,
                        
                      // ]),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                                  Colors.orange,
                                                  Colors.orangeAccent,
                                                  const Color(0xFFFEC18A)
                                                ]),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        18.0)),
                                            child: Center(
                                                child: snapshot.data[index]
                                                            .symbol ==
                                                        'HOOD'
                                                    ? Image.asset(
                                                        'assets/hood.png',
                                                        scale: 1.3,
                                                      )
                                                    : snapshot.data[index].symbol ==
                                                            'SQ'
                                                        ? Image.asset(
                                                            'assets/sq.png')
                                                        : snapshot.data[index]
                                                                    .symbol ==
                                                                'TSLA'
                                                            ? Image.asset(
                                                                'assets/tesla.png',
                                                                scale: 1.3,
                                                              )
                                                            : snapshot.data[index].symbol ==
                                                                    'SQ'
                                                                ? Image.asset(
                                                                    'assets/sq.png')
                                                                : snapshot.data[index].symbol ==
                                                                        'MSFT'
                                                                    ? Icon(FontAwesomeIcons.microsoft)
                                                                    : snapshot.data[index].symbol == 'TWTR'
                                                                        ? Icon(FontAwesomeIcons.twitter)
                                                                        : snapshot.data[index].symbol == 'AAPL'
                                                                            ? Icon(FontAwesomeIcons.apple)
                                                                            : snapshot.data[index].symbol == 'GOOGL'
                                                                                ? Icon(FontAwesomeIcons.google)
                                                                                : snapshot.data[index].symbol == 'FB'
                                                                                    ? Icon(FontAwesomeIcons.facebook)
                                                                                    : Container())),
                                      ),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            snapshot.data[index].symbol,
                                            style:
                                                GoogleFonts.bigShouldersText(
                                                  color: Colors.black54,
                                                    fontWeight:
                                                        FontWeight.bold,
                                                    fontSize: 20),
                                          ),
                                          Text(
                                            ' ${snapshot.data[index].side} ${snapshot.data[index].qty} @ \$${double.parse(snapshot.data[index].price).toStringAsFixed(2)}',
                                            style: TextStyle(
                                              color: Colors.black54,
                                                fontFamily: 'Lato',
                                                fontWeight: FontWeight.w100,
                                                fontSize: 15),
                                          ),
                                          Text(
                                            snapshot
                                                .data[index].transactionTime,
                                            style: TextStyle(
                                              color: Colors.black54,
                                                fontFamily: 'Lato',
                                                fontWeight: FontWeight.w100,
                                                fontSize: 15),
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  );
                })
          ],
        ),
      ),
    );
  }
}
