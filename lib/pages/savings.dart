import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:projectdojo/savings/personalsavingshome.dart';

class Savings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color greenColor = const Color(0xFF00AF19);
    Size size = MediaQuery.of(context).size;
    final numberFormat = new NumberFormat("##,###.00#", "en_US");
    final TextStyle cardNumberStyle =
        GoogleFonts.openSans(fontSize: 18, fontWeight: FontWeight.w600);
    final TextStyle cardTextStyle =
        GoogleFonts.spartan(color: Colors.black, fontWeight: FontWeight.w600);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Stack(children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.greenAccent.withOpacity(0.5),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  child: Container(
                    height: size.height * 0.38,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30.0),
                          bottomRight: Radius.circular(30.0)),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomCenter,
                          colors: [
                            const Color(0xffE0ABF2),
                            Colors.greenAccent,
                            Colors.greenAccent.withOpacity(0.5),
                          ]),
                    ),
                  ),
                ),
                Transform(
                  alignment: FractionalOffset.center,
                  transform: Matrix4.identity()..rotateZ(-7 * 3.1415927 / 180),
                  child: Padding(
                    padding: const EdgeInsets.all(23),
                    child: Container(
                        decoration: BoxDecoration(
                          // boxShadow: [
                          //       BoxShadow(
                          //           blurRadius: 2,
                          //           spreadRadius: 2,
                          //           color: Colors.grey.withOpacity(0.2))
                          //     ],
                          border: Border.all(
                              color: Colors.black.withOpacity(0.1), width: 2.0),
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey[100].withOpacity(0.5),
                        ),
                        height: size.height * 0.3,
                        width: 400,
                        child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Total Savings',
                                        style: cardTextStyle.copyWith(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                          r'ksh' +
                                              "${numberFormat.format(27802.05)}",
                                          style: cardNumberStyle.copyWith(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black)),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                  ),
                ),
              ]),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Save in any currency,crypto or commodity',
                  style: TextStyle(
                      fontFamily: 'Trueno',
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),

              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PersonalSavingsHome()));
                },
                child: Card(
                  elevation: 5.0,
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
                            Container(
                              child: Center(
                                  child: Icon(FontAwesomeIcons.solidUser)),
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  // color: Colors.deepOrangeAccent,
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        const Color(0xffE0ABF2),
                                        Colors.greenAccent,
                                        Colors.greenAccent.withOpacity(0.5),
                                      ]),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100.0))),
                            ),
                            const SizedBox(
                              height: 10.0,
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
                                Text('Personal vault',
                                    style: TextStyle(
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18)),
                              ],
                            ),
                          ],
                        ),
                        Container(
                            height: 100.0,
                            width: 100.0,
                            decoration: BoxDecoration(
                                // gradient: LinearGradient(colors: [
                                //   const Color(0xff23b6e6),
                                //   const Color(0xff02d39a),
                                //   const Color(0xFFFEC18A)
                                // ]),
                                borderRadius: BorderRadius.circular(18.0)),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(18.0),
                                child: Image.asset(
                                  "assets/revolutvault.png",
                                  fit: BoxFit.cover,
                                ))),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Center(child: Icon(FontAwesomeIcons.users)),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                // color: Colors.deepOrangeAccent,
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      const Color(0xffE0ABF2),
                                      Colors.greenAccent,
                                      Colors.greenAccent.withOpacity(0.5),
                                    ]),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100.0))),
                          ),
                          const SizedBox(
                            height: 10.0,
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
                              Text('Group vault',
                                  style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18)),
                            ],
                          ),
                        ],
                      ),
                      Container(
                          height: 100.0,
                          width: 100.0,
                          decoration: BoxDecoration(
                              // gradient: LinearGradient(colors: [
                              //   const Color(0xff23b6e6),
                              //   const Color(0xff02d39a),
                              //   const Color(0xFFFEC18A)
                              // ]),
                              borderRadius: BorderRadius.circular(18.0)),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(18.0),
                              child: Image.asset(
                                "assets/revolutvault.png",
                                fit: BoxFit.cover,
                              ))),
                    ],
                  ),
                ),
              ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     Container(
              //       decoration: BoxDecoration(
              //           color: greenColor,
              //           borderRadius: BorderRadius.circular(30)),
              //       child: Container(
              //         height: size.height * 0.28,
              //         width: size.width * 0.5 - 20,
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(30),
              //           gradient: LinearGradient(
              //               begin: Alignment.topLeft,
              //               end: Alignment.bottomCenter,
              //               colors: [
              //                 Colors.greenAccent,
              //                 Colors.greenAccent.withOpacity(0.5),
              //               ]),
              //         ),
              //         child:
              //             //  Expanded(
              //             //   child:
              //             Align(
              //           alignment: Alignment.center,
              //           child: Column(
              //             children: [
              //               Lottie.asset("assets/centology.json"),
              //               Text(
              //                 'Personal Savings',
              //                 style: GoogleFonts.bigShouldersText(
              //                     fontWeight: FontWeight.w600, fontSize: 18),
              //               ),
              //               SizedBox(
              //                 height: 10,
              //               ),
              //               Text(r'ksh' + "${numberFormat.format(27802.05)}",
              //                   style: cardNumberStyle.copyWith(
              //                       fontSize: 18,
              //                       fontWeight: FontWeight.w600,
              //                       color: Colors.black)),
              //               // Text('Savings',)
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //     Container(
              //       decoration: BoxDecoration(
              //           color: greenColor,
              //           borderRadius: BorderRadius.circular(30)),
              //       child: Container(
              //         height: size.height * 0.28,
              //         width: size.width * 0.5 - 20,
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(30),
              //           gradient: LinearGradient(
              //               begin: Alignment.topLeft,
              //               end: Alignment.bottomCenter,
              //               colors: [
              //                 Colors.greenAccent,
              //                 Colors.greenAccent.withOpacity(0.5),
              //               ]),
              //         ),
              //         child:
              //             //  Expanded(
              //             //   child:
              //             Align(
              //           alignment: Alignment.center,
              //           child: Padding(
              //             padding: const EdgeInsets.all(16.0),
              //             child: Column(
              //               // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 Lottie.asset("assets/grupo.json",
              //                     height: size.height * 0.1),
              //                 SizedBox(
              //                   height: 5.0,
              //                 ),
              //                 Text(
              //                   'Group Savings',
              //                   style: GoogleFonts.bigShouldersText(
              //                       fontWeight: FontWeight.w600, fontSize: 18),
              //                 ),
              //                 SizedBox(
              //                   height: 10,
              //                 ),
              //                 Text(r'ksh' + "${numberFormat.format(27802.05)}",
              //                     style: cardNumberStyle.copyWith(
              //                         fontSize: 18,
              //                         fontWeight: FontWeight.w600,
              //                         color: Colors.black)),
              //                 // Text('Savings',)
              //               ],
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //     // ),
              //   ],
              // ),

              // Container(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Container(
              //               height: 54.0,
              //               width: 54.0,
              //               decoration: BoxDecoration(
              //                   color: Colors.greenAccent.withOpacity(0.3),
              //                   borderRadius: BorderRadius.circular(18.0)),
              //               child: Center(
              //                 child: Text('🚀', style: TextStyle(fontSize: 30)),
              //               )),
              //           Padding(
              //             padding: const EdgeInsets.all(8.0),
              //             child: Text(
              //               'Stock investments',
              //               style: GoogleFonts.bigShouldersText(
              //                   fontWeight: FontWeight.bold, fontSize: 18),
              //             ),
              //           )
              //         ],
              //       ),
              //       Text(r'ksh' + "${numberFormat.format(27802.05)}",
              //           style: cardNumberStyle.copyWith(
              //             fontSize: 15,
              //             fontWeight: FontWeight.w600,
              //           )),
              //     ],
              //   ),
              // ),
              // Container(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Container(
              //               height: 54.0,
              //               width: 54.0,
              //               decoration: BoxDecoration(
              //                   color: Colors.greenAccent.withOpacity(0.3),
              //                   borderRadius: BorderRadius.circular(18.0)),
              //               child: Center(
              //                 child: Text('🚀', style: TextStyle(fontSize: 30)),
              //               )),
              //           Padding(
              //             padding: const EdgeInsets.all(8.0),
              //             child: Text(
              //               'Stock investments',
              //               style: GoogleFonts.bigShouldersText(
              //                   fontWeight: FontWeight.bold, fontSize: 18),
              //             ),
              //           )
              //         ],
              //       ),
              //       Text(r'ksh' + "${numberFormat.format(27802.05)}",
              //           style: cardNumberStyle.copyWith(
              //             fontSize: 15,
              //             fontWeight: FontWeight.w600,
              //           )),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
