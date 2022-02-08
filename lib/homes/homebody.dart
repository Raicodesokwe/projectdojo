import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key key, @required this.size}) : super(key: key);
  final Size size;
  @override
  Widget build(BuildContext context) {
    Color greenColor = const Color(0xFF00AF19);
    final numberFormat = new NumberFormat("##,###.00#", "en_US");
    final TextStyle cardNumberStyle =
        GoogleFonts.openSans(fontSize: 18, fontWeight: FontWeight.w600);
    return Container(
      
      // height: size.height,
    
      // color: Colors.red,
      // padding: EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(r'ksh' + "${numberFormat.format(27802.05)}",
                    style: cardNumberStyle.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    )),
                const SizedBox(
                  height: 5.0,
                ),
                // VerticalDivider(thickness: 1.0,color: Colors.red,),
                // Text(
                //   '114 investors',
                //   style: TextStyle(
                //       fontFamily: 'Lato',
                //       fontWeight: FontWeight.w300,
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
              ],
            ),
          ),
           SizedBox(height: size.height *0.05,),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              // decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),

              height: 15,
              width: size.width * 0.7,
              child: LinearProgressIndicator(
                value: 0.7,
                backgroundColor: Colors.greenAccent.withOpacity(0.3),
                valueColor: new AlwaysStoppedAnimation<Color>(greenColor),
              ),
            ),
          ),
          SizedBox(height: size.height *0.05,),
             Card(
               elevation: 10.0,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'Let\'s run some numbers, shall we?',
                        style: TextStyle(
                            fontFamily: 'Anton',
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      ),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'House price',
                              style: TextStyle(
                                  color: Colors.green[700],
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w300,
                                  fontSize: 15),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            // Divider(color: Colors.red,),
                            Text(r'ksh' + "${numberFormat.format(27802000.05)}",
                                style: cardNumberStyle.copyWith(
                                  fontSize: 16.5,
                                  fontWeight: FontWeight.w600,
                                )),
                            const SizedBox(
                              height: 20.0,
                            ),
                            

                            // Divider(color: Colors.red,),
                          ],
                        ),
                        // VerticalDivider(width: 2.0,),
                        // Container(height: 5.0,child: VerticalDivider(color: Colors.grey,),),
                        Column(
                          children: [
                            Text(
                              'Annual appreciation',
                              style: TextStyle(
                                  color: Colors.green[700],
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w300,
                                  fontSize: 15),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text("5.36%",
                                style: cardNumberStyle.copyWith(
                                  fontSize: 20.5,
                                  fontWeight: FontWeight.w600,
                                )),
                            const SizedBox(
                              height: 20.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          
          SizedBox(height: size.height *0.07,),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Text(
              
              'This 4 bedroom townhouse in Migaa estate,Kiambu county is a modern showpiece with ample natural light and high end amenities. The projected rental income of this property is around ksh 56,000. Come invest with us',
              style: TextStyle(
                letterSpacing: 2,
                  // color: Colors.green[700],
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w300,
                  fontSize: 17),
            ),
          ),
        ],
      ),
    );
  }
}
