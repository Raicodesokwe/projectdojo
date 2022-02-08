import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeCardsStacked extends StatelessWidget {
  const HomeCardsStacked({
    Key key,
    @required this.decorator,
    @required this.cardTextStyle,
    @required this.numberFormat,
    @required this.cardNumberStyle,
    @required this.greenColor,
    @required this.size,
  }) : super(key: key);

  final BoxDecoration decorator;
  final TextStyle cardTextStyle;
  final NumberFormat numberFormat;
  final TextStyle cardNumberStyle;
  final Color greenColor;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: 500.0,
      child: Stack(
        children: [
          GestureDetector(
            onTap: (){
               
            },
            child: Container(
              height: 140.0,
              decoration: decorator,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('DIA', style: cardTextStyle),
                    Text(
                        r'ksh' +
                            "${numberFormat.format(27802.05)}",
                        style: cardNumberStyle),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 75.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              height: 120,
              decoration: decorator.copyWith(
                gradient: LinearGradient(colors: [
                  const Color(0xffE0ABF2),
                  greenColor
                ]),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('SPY', style: cardTextStyle),
                    Text(
                      r'ksh' +
                          "${numberFormat.format(27802.05)}",
                      style: cardNumberStyle,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 150.0,
            right: 0.0,
            left: 0.0,
            child: Container(
                height: 120,
                decoration: decorator.copyWith(
                  borderRadius: BorderRadius.circular(30.0),
                  gradient: LinearGradient(colors: [
                    Color(0xFFFCA7E2),
                    Color(0xFFFC9FD2),
                    Color(0xFFFCD8BD),
                    greenColor
                  ]),
                ),
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
                            'QQQ',
                            style: cardTextStyle,
                          ),
                        ],
                      ),
                      Text(
                          r'ksh' +
                              "${numberFormat.format(27802.05)}",
                          style: cardNumberStyle),
                    ],
                  ),
                )),
          ),
          Positioned(
            top: 230.0,
            right: 0.0,
            left: 0.0,
            child: Container(
                height: 200,
                decoration: decorator.copyWith(
                  borderRadius: BorderRadius.circular(30.0),
                  gradient: LinearGradient(colors: [
                    Color(0xFFFCA7E2),
                    Color(0xFFFC9FD2),
                    Color(0xFFFCD8BD),
                    greenColor
                  ]),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        'IWM',
                        style: cardTextStyle,
                      ),
                      Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.end,
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              r'ksh' +
                                  "${numberFormat.format(27802.05)}",
                              style: cardNumberStyle),
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.center,
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
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}