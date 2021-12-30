import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:projectdojo/insurance/starrating.dart';
import 'package:provider/provider.dart';

import '../theme.dart';

class Medical extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeProvider>(context).darkTheme;
    final numberFormat = new NumberFormat("##,###.00#", "en_US");
    Color greenColor = const Color(0xFF00AF19);
    final TextStyle cardNumberStyle =
        GoogleFonts.openSans(fontSize: 18, fontWeight: FontWeight.w600);
    Size size = MediaQuery.of(context).size;
    final TextStyle cardTextStyle =
        GoogleFonts.spartan(color: Colors.white, fontWeight: FontWeight.w600);
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
              'Medical',
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
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
            ),
            child: Column(
              children: [
                Stack(children: [
                  Container(
                      height: 200,
                      // width: double.infinity,
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
                      child: Column(

                          // mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(width: 25.0,),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                'We\'ve found',
                                style: cardTextStyle.copyWith(
                                    fontSize: 30, fontWeight: FontWeight.w600),
                              ),
                            ),
                            // const SizedBox(
                            //   height: 25.0,
                            // ),

                            Container(
                              height: 40,
                              // width: 200,
                              child: Text('23 offers',
                                  style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 40)),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              'for medical insurance',
                              style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w200,
                                  fontSize: 15),
                            ),
                            // const SizedBox(
                            //   height: 20.0,
                            // ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
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
                            ),
                          ])),
                  Positioned(
                      left: 3,
                      top: 70,
                      // top: -20,
                      // height: 10,
                      child: Container(
                        height: 50,
                        width: 70,
                        decoration: BoxDecoration(
                            color: Colors.cyanAccent,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0))),
                        child: Center(
                          child: Icon(FontAwesomeIcons.hospital),
                        ),
                      ))
                ]),
                const SizedBox(
                  height: 10.0,
                ),
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: Row(
                      children: [
                        Container(
                          height: 70,
                          width: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            color: themeData
                                ? const Color(0xFFFEC18A)
                                // const Color(0xff23b6e6)
                                // const Color(0xff02d39a)
                                : Theme.of(context).scaffoldBackgroundColor,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 8,
                                  spreadRadius: 6,
                                  offset: Offset(0, 3),
                                  color: Colors.black.withOpacity(0.2))
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Coverage',
                                      style: cardTextStyle.copyWith(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w200,
                                          color: Colors.black),
                                    ),
                                    Text('Basic plan',
                                        style: TextStyle(
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.w800,
                                            fontSize: 18)),
                                  ],
                                ),
                                Icon(FontAwesomeIcons.angleDown)
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Container(
                          height: 70,
                          width: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            color: themeData
                                ? const Color(0xFFFEC18A)
                                // const Color(0xff23b6e6)
                                // const Color(0xff02d39a)
                                : Theme.of(context).scaffoldBackgroundColor,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 8,
                                  spreadRadius: 6,
                                  offset: Offset(0, 3),
                                  color: Colors.black.withOpacity(0.2))
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Duration',
                                      style: cardTextStyle.copyWith(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w200,
                                          color: Colors.black),
                                    ),
                                    Text('2 years',
                                        style: TextStyle(
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.w800,
                                            fontSize: 18)),
                                  ],
                                ),
                                Icon(FontAwesomeIcons.angleDown)
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Container(
                          height: 70,
                          width: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            color: themeData
                                ? const Color(0xFFFEC18A)
                                // const Color(0xff23b6e6)
                                // const Color(0xff02d39a)
                                : Theme.of(context).scaffoldBackgroundColor,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 8,
                                  spreadRadius: 6,
                                  offset: Offset(0, 3),
                                  color: Colors.black.withOpacity(0.2))
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Coverage',
                                      style: cardTextStyle.copyWith(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w200,
                                          color: Colors.black),
                                    ),
                                    Text('Basic plan',
                                        style: TextStyle(
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.w800,
                                            fontSize: 18)),
                                  ],
                                ),
                                Icon(FontAwesomeIcons.angleDown)
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Container(
                          height: 70,
                          width: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            color: themeData
                                ? const Color(0xFFFEC18A)
                                // const Color(0xff23b6e6)
                                // const Color(0xff02d39a)
                                : Theme.of(context).scaffoldBackgroundColor,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 8,
                                  spreadRadius: 6,
                                  offset: Offset(0, 3),
                                  color: Colors.black.withOpacity(0.2))
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Coverage',
                                      style: cardTextStyle.copyWith(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w200,
                                          color: Colors.black),
                                    ),
                                    Text('Basic plan',
                                        style: TextStyle(
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.w800,
                                            fontSize: 18)),
                                  ],
                                ),
                                Icon(FontAwesomeIcons.angleDown)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Stack(children: [
                  Card(
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'UAP-Old Mutual',
                                style: cardTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w200,
                                    color: Colors.black),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: [
                                  StarRating((rating) {}),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    '218 Reviews',
                                    style: GoogleFonts.bigShouldersText(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.check,
                                    color: Colors.greenAccent,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Text('Pre-existing conditions',
                                      style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15)),
                                ],
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.check,
                                    color: Colors.greenAccent,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Text('Ksh 5 million limit',
                                      style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15)),
                                ],
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.check,
                                    color: Colors.greenAccent,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Text('Coverage of close family members',
                                      style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13)),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(r'ksh' + "${numberFormat.format(2780.05)}",
                                  style: cardNumberStyle.copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  )),
                              Text('Per month',
                                  style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w800,
                                      fontSize: 10)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                   Positioned(
                    bottom: 110,
                    right: 2,
                    child: Container(
                      child: Center(
                          child: Icon(
                        FontAwesomeIcons.angleRight,
                        color: Colors.black,
                      )),
                      height: 50,
                      width: 60,
                      decoration: BoxDecoration(
                          color: const Color(0xFFFEC18A),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50.0),
                              bottomLeft: Radius.circular(50.0))),
                    ),
                  ),
                ]),
                const SizedBox(height: 15.0,),
                Stack(children: [
                  Card(
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Britam',
                                style: cardTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w200,
                                    color: Colors.black),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: [
                                  StarRating((rating) {}),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    '738 Reviews',
                                    style: GoogleFonts.bigShouldersText(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.check,
                                    color: Colors.greenAccent,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Text('Pre-existing conditions',
                                      style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15)),
                                ],
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.check,
                                    color: Colors.greenAccent,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Text('Ksh 5 million limit',
                                      style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15)),
                                ],
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.check,
                                    color: Colors.greenAccent,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Text('Coverage of close family members',
                                      style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13)),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(r'ksh' + "${numberFormat.format(3450.05)}",
                                  style: cardNumberStyle.copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  )),
                              Text('Per month',
                                  style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w800,
                                      fontSize: 10)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                   Positioned(
                    bottom: 110,
                    right: 2,
                    child: Container(
                      child: Center(
                          child: Icon(
                        FontAwesomeIcons.angleRight,
                        color: Colors.black,
                      )),
                      height: 50,
                      width: 60,
                      decoration: BoxDecoration(
                          color: const Color(0xFFFEC18A),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50.0),
                              bottomLeft: Radius.circular(50.0))),
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
