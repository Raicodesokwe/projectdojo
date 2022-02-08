import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:projectdojo/insurance/medical.dart';
import 'package:projectdojo/insurance/starrating.dart';
import 'package:projectdojo/theme.dart';
import 'package:provider/provider.dart';

class InsuranceLanding extends StatefulWidget {
  @override
  _InsuranceLandingState createState() => _InsuranceLandingState();
}

class _InsuranceLandingState extends State<InsuranceLanding> {
  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeProvider>(context).darkTheme;
    Size size = MediaQuery.of(context).size;
    final BoxDecoration decorator = BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        border: Border.all(color: Colors.black.withOpacity(0.5), width: 4.0),
        gradient: const LinearGradient(colors: [
          const Color(0xff23b6e6),
          const Color(0xff02d39a),
          const Color(0xFFFEC18A)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight));
    final numberFormat = new NumberFormat("##,###.00#", "en_US");

    final TextStyle cardNumberStyle =
        GoogleFonts.openSans(fontSize: 18, fontWeight: FontWeight.w600);
    final TextStyle cardTextStyle =
        GoogleFonts.spartan(color: Colors.white, fontWeight: FontWeight.w600);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text(
                      'Happy to have you onboard! Let\'s start by finding out which insurance you need.',
                      style: TextStyle(
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400,
                          fontSize: 17)),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Stack(children: [
                  Container(
                      height: size.height * 0.26,
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
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // const SizedBox(width: 25.0,),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                'Discover what fits your needs',
                                style: cardTextStyle.copyWith(
                                    fontSize: 17, fontWeight: FontWeight.w600),
                              ),
                            ),
                            // const SizedBox(
                            //   height: 25.0,
                            // ),

                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Stack(children: [
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          border: Border.all(
                                              width: 3, color: Colors.white)),

                                      child: Container(
                                        // margin: EdgeInsets.all(5),
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            border: Border.all(
                                                width: 3, color: Colors.white)),
                                      ),
                                      // Transform.rotate(
                                      //   angle: 1/4*180,
                                      //   child: Icon(
                                      //     FontAwesomeIcons.arrowAltCircleLeft,
                                      //     size: 23,
                                      //     color: Colors.white,
                                      //   ),
                                      // ),
                                    ),
                                    Positioned(
                                        bottom: 5,
                                        right: 5,
                                        child: Transform.rotate(
                                          angle: 0.25 * 180,
                                          child: Icon(
                                            FontAwesomeIcons.solidHandPointLeft,
                                            size: 30,
                                            color: const Color(0xFFFEC18A),
                                          ),
                                        ))
                                  ]),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Container(
                                  height: size.height * 0.08,
                                  width: 200,
                                  child: Text(
                                      'Tap here to help you identify areas where you need protection',
                                      style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 17)),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 28.0,
                            ),
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
                    bottom: 90,
                    right: 3,
                    child: Container(
                      child: Center(
                          child: Icon(
                        FontAwesomeIcons.angleRight,
                        color: Colors.black,
                      )),
                      height: 50,
                      width: 52,
                      decoration: BoxDecoration(
                          color: Colors.grey[100].withOpacity(0.5),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50.0),
                              bottomLeft: Radius.circular(50.0))),
                    ),
                  ),
                ]),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text('Recommended for you',
                      style: TextStyle(
                          fontFamily: 'Trueno',
                          fontWeight: FontWeight.w600,
                          fontSize: 20)),
                ),
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
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Stack(clipBehavior: Clip.none, children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Medical()));
                            },
                            child: Container(
                              height: 150,
                              width: size.width * 0.5 - 20,
                              padding:
                                  const EdgeInsets.only(left: 5.0, top: 16.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32.0),
                                color: themeData
                                    ? const Color(0xFFFEC18A)
                                    // const Color(0xff23b6e6)
                                    // const Color(0xff02d39a)
                                    : Theme.of(context).scaffoldBackgroundColor,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 12,
                                      spreadRadius: 8,
                                      offset: Offset(0, 3),
                                      color: Colors.black.withOpacity(0.2))
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Medical',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Trueno',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17)),
                                    const SizedBox(
                                      height: 8.0,
                                    ),
                                    Text(
                                        'Avoid the risk of costly overruns when you fall ill',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13)),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Text("from Ksh 1,000/mo",
                                        style: cardNumberStyle.copyWith(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w800,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                              left: 30,
                              top: -20,
                              // height: 10,
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: Colors.cyanAccent,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: Center(
                                  child: Icon(FontAwesomeIcons.hospital),
                                ),
                              ))
                        ]),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Stack(clipBehavior: Clip.none, children: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Car',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Trueno',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17)),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  Text(
                                      'Check out the best car insurance policies available',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13)),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Text("from Ksh 500/mo",
                                      style: cardNumberStyle.copyWith(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w800,
                                      )),
                                ],
                              ),
                            ),
                            height: 150,
                            width: size.width * 0.5 - 20,
                            padding: const EdgeInsets.only(left: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32.0),
                              color: themeData
                                  ? const Color(0xFFFEC18A)
                                  // const Color(0xff23b6e6)
                                  // const Color(0xff02d39a)
                                  : Theme.of(context).scaffoldBackgroundColor,
                              // color: Theme.of(context).scaffoldBackgroundColor,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 12,
                                    spreadRadius: 8,
                                    color: Colors.black.withOpacity(0.2))
                              ],
                            ),
                          ),
                          Positioned(
                              left: 30,
                              top: -20,
                              // height: 10,
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: Colors.cyanAccent,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: Center(
                                  child: Icon(FontAwesomeIcons.car),
                                ),
                              ))
                        ]),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Stack(clipBehavior: Clip.none, children: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 10.0, right: 10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('House',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Trueno',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17)),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  Text(
                                      'Insure your house against any damage that may occur',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13)),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Text("from Ksh 750/mo",
                                      style: cardNumberStyle.copyWith(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w800,
                                      )),
                                ],
                              ),
                            ),
                            height: 150,
                            width: size.width * 0.5 - 20,
                            padding: const EdgeInsets.only(left: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32.0),
                              color: themeData
                                  ? const Color(0xFFFEC18A)
                                  // const Color(0xff23b6e6)
                                  // const Color(0xff02d39a)
                                  : Theme.of(context).scaffoldBackgroundColor,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 12,
                                    spreadRadius: 8,
                                    color: Colors.black.withOpacity(0.2))
                              ],
                            ),
                          ),
                          Positioned(
                              left: 30,
                              top: -20,
                              // height: 10,
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: Colors.cyanAccent,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: Center(
                                  child: Icon(FontAwesomeIcons.home),
                                ),
                              ))
                        ]),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Stack(clipBehavior: Clip.none, children: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 10.0, right: 10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Device',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Trueno',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17)),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  Text(
                                      'Insure your device against any theft or damage that may occur',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13)),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Text("from Ksh 750/mo",
                                      style: cardNumberStyle.copyWith(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w800,
                                      )),
                                ],
                              ),
                            ),
                            height: 150,
                            width: size.width * 0.5 - 20,
                            padding: const EdgeInsets.only(left: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32.0),
                              color: themeData
                                  ? const Color(0xFFFEC18A)
                                  // const Color(0xff23b6e6)
                                  // const Color(0xff02d39a)
                                  : Theme.of(context).scaffoldBackgroundColor,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 12,
                                    spreadRadius: 8,
                                    color: Colors.black.withOpacity(0.2))
                              ],
                            ),
                          ),
                           Positioned(
                              left: 30,
                              top: -20,
                              // height: 10,
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: Colors.cyanAccent,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: Center(
                                  child: Icon(FontAwesomeIcons.mobile),
                                ),
                              ))
                        ]),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 13.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text('Pay existing insurance premium',
                      style: TextStyle(
                          fontFamily: 'Trueno',
                          fontWeight: FontWeight.w600,
                          fontSize: 20)),
                ),
                const SizedBox(
                  height: 13.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Column(
                    children: [
                      Card(
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      height: 65.0,
                                      width: 65.0,
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
                                              FontAwesomeIcons.motorcycle))),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 90,
                                      height: 50,
                                      child: Text(
                                        'Two wheeler insurance',
                                        style: GoogleFonts.bigShouldersText(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                      ),
                                    ),
                                    StarRating((rating) {})
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  r'ksh' + "${numberFormat.format(2780.05)}",
                                  style: cardNumberStyle.copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
