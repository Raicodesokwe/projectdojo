import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:projectdojo/homes/homesample.dart';
import 'package:projectdojo/services/investtoggle.dart';

class PropertyInvestments extends StatefulWidget {
  @override
  _PropertyInvestmentsState createState() => _PropertyInvestmentsState();
}

class _PropertyInvestmentsState extends State<PropertyInvestments> {
  int _toggleValue = 0;
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
        child: Container(
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
                expandedHeight: size.height * 0.62,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Add your property',
                                style: TextStyle(
                                    fontFamily: 'Anton',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    //  boxShadow: [
                                    //       BoxShadow(
                                    //           blurRadius: 2,
                                    //           spreadRadius: 2,
                                    //           color: Colors.black87.withOpacity(0.2))
                                    //     ],
                                    color: Colors.greenAccent,
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Icon(FontAwesomeIcons.plusCircle
                                    // Icons.add,
                                    // color: Colors.green[300],
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
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
                                              'Property Investments',
                                              style: cardTextStyle.copyWith(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                    r'ksh' +
                                                        "${numberFormat.format(27802.05)}",
                                                    style: cardNumberStyle
                                                        .copyWith(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color:
                                                                Colors.black)),
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
                                                          child:  Container(
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
                                                            child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            18.0),
                                                                child:
                                                                    Image.asset(
                                                                  "assets/student.jpg",
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ))
                                                            // Center(
                                                            //     child: Icon(
                                                            //         FontAwesomeIcons
                                                            //             .home))

                                                            ),),
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
                                                            child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            18.0),
                                                                child:
                                                                    Image.asset(
                                                                  "assets/hoteli.jpg",
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ))
                                                            // Center(
                                                            //     child: Icon(
                                                            //         FontAwesomeIcons
                                                            //             .home))

                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
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
                                builder: (context) => PropInvest()));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      height: 120.0,
                                      width: 120.0,
                                      decoration: BoxDecoration(
                                         
                                          borderRadius:
                                              BorderRadius.circular(18.0)),
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          child: Image.asset(
                                            "assets/student.jpg",
                                            fit: BoxFit.cover,
                                          )
                                          )
                                          ),
                                ),
                                // const SizedBox(
                                //   width: 5.0,
                                // ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        // alignment: Alignment.bottomRight,
                                        height: 50,
                                        width: 140,
                                        child: Text(
                                          'Student hostels',
                                          // overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.bigShouldersText(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                      ),
                                      Text(
                                        'Madaraka',
                                        style: TextStyle(
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.w100,
                                            fontSize: 15),
                                      ),
                                      Text(
                                          r'ksh' +
                                              "${numberFormat.format(27802.05)}",
                                          style: cardNumberStyle.copyWith(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                          )),
                                      const SizedBox(
                                        height: 5.0,
                                      ),
                                     
                                      Text(
                                        "10% return in 6 months",
                                        style: GoogleFonts.spartan(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.green[300],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.arrowCircleUp,
                                            color: Colors.green[300],
                                          ),
                                          const SizedBox(
                                            width: 30.0,
                                          ),
                                          Chip(
                                            label: Text(
                                              'sold out',
                                              style: TextStyle(
                                                  fontFamily: 'Lato',
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.w100,
                                                  fontSize: 9),
                                            ),
                                            backgroundColor: Colors.redAccent
                                                .withOpacity(0.1),
                                          )
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
                            left: 8.0, right: 8.0, top: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PropInvest()));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      height: 120.0,
                                      width: 120.0,
                                      decoration: BoxDecoration(
                                          
                                          borderRadius:
                                              BorderRadius.circular(18.0)),
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          child: Image.asset(
                                            "assets/apart.jpg",
                                            fit: BoxFit.cover,
                                          )
                                          )
                                          ),
                                ),
                                // const SizedBox(
                                //   width: 5.0,
                                // ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        // alignment: Alignment.bottomRight,
                                        height: 50,
                                        width: 140,
                                        child: Text(
                                          'Modern apartment',
                                          // overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.bigShouldersText(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                      ),
                                      Text(
                                        'Rironi',
                                        style: TextStyle(
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.w100,
                                            fontSize: 15),
                                      ),
                                      Text(
                                          r'ksh' +
                                              "${numberFormat.format(27802.05)}",
                                          style: cardNumberStyle.copyWith(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                          )),
                                      const SizedBox(
                                        height: 5.0,
                                      ),
                                     
                                      Text(
                                        "15% return in 10 months",
                                        style: GoogleFonts.spartan(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.green[300],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.arrowCircleUp,
                                            color: Colors.green[300],
                                          ),
                                          const SizedBox(
                                            width: 30.0,
                                          ),
                                          Chip(
                                            label: Text(
                                              'sold out',
                                              style: TextStyle(
                                                  fontFamily: 'Lato',
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.w100,
                                                  fontSize: 9),
                                            ),
                                            backgroundColor: Colors.redAccent
                                                .withOpacity(0.1),
                                          )
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
                            left: 8.0, right: 8.0, top: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PropInvest()));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      height: 120.0,
                                      width: 120.0,
                                      decoration: BoxDecoration(
                                          // gradient: LinearGradient(colors: [
                                          //   const Color(0xff23b6e6),
                                          //   const Color(0xff02d39a),
                                          //   const Color(0xFFFEC18A)
                                          // ]),
                                          borderRadius:
                                              BorderRadius.circular(18.0)),
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          child: Image.asset(
                                            "assets/hoteli.jpg",
                                            fit: BoxFit.cover,
                                          )
                                          )
                                          ),
                                ),
                                // const SizedBox(
                                //   width: 5.0,
                                // ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        // alignment: Alignment.bottomRight,
                                        height: 50,
                                        width: 140,
                                        child: Text(
                                          'Four bedroom townhouse',
                                          // overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.bigShouldersText(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                      ),
                                      Text(
                                        'Kiambu',
                                        style: TextStyle(
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.w100,
                                            fontSize: 15),
                                      ),
                                      Text(
                                          r'ksh' +
                                              "${numberFormat.format(27802.05)}",
                                          style: cardNumberStyle.copyWith(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                          )),
                                      const SizedBox(
                                        height: 5.0,
                                      ),
                                      // Text(
                                      //   '114 investors',
                                      //   style: TextStyle(
                                      //       fontFamily: 'Lato',
                                      //       fontWeight: FontWeight.w100,
                                      //       fontSize: 12),
                                      // ),
                                      // const SizedBox(
                                      //   height: 5.0,
                                      // ),
                                      Text(
                                        "15% return in 6 months",
                                        style: GoogleFonts.spartan(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.green[300],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.arrowCircleUp,
                                            color: Colors.green[300],
                                          ),
                                          const SizedBox(
                                            width: 30.0,
                                          ),
                                          Chip(
                                            label: Text(
                                              'sold out',
                                              style: TextStyle(
                                                  fontFamily: 'Lato',
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.w100,
                                                  fontSize: 9),
                                            ),
                                            backgroundColor: Colors.redAccent
                                                .withOpacity(0.1),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: Column(
                            //     children: [
                            //       // Text(
                            //       //     r'ksh' +
                            //       //         "${numberFormat.format(27802.05)}",
                            //       //     style: cardNumberStyle.copyWith(
                            //       //       fontSize: 15,
                            //       //       fontWeight: FontWeight.w600,
                            //       //     )),
                            //       // Row(
                            //       //   children: [
                            //       //     Text(
                            //       //       "15%",
                            //       //       style: GoogleFonts.spartan(
                            //       //         fontSize: 12,
                            //       //         fontWeight: FontWeight.w700,
                            //       //         color: Colors.green[300],
                            //       //       ),
                            //       //     ),
                            //       //     Icon(
                            //       //       FontAwesomeIcons.arrowCircleUp,
                            //       //       color: Colors.green[300],
                            //       //     ),
                            //       //   ],
                            //       // ),
                            //     ],
                            //   ),
                          ),
                        ),
                      ),
                    
                      
                    ],
                  ),
                )
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
