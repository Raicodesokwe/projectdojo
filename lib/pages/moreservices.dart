import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectdojo/bnpl/bnplhome.dart';
import 'package:projectdojo/insurance/insurancelanding.dart';


class MoreServices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextStyle cardTextStyle =
        GoogleFonts.spartan(fontWeight: FontWeight.w600);
    Color greenColor = const Color(0xFF00AF19);
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          children: [
            Center(
              child: Text('Additional services',
                  style: TextStyle(
                      fontFamily: 'Trueno',
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Theme.of(context).textTheme.headline6.color)),
            ),
            SizedBox(
              height: 20.0,
            ),
           
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => InsuranceLanding()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: greenColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(34),
                                  topRight: Radius.circular(34))),
                          child: Container(
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: RotatedBox(
                                    quarterTurns: 1,
                                    child: Container(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child:
                                            Icon(FontAwesomeIcons.arrowAltCircleUp),
                                      ),
                                      width: size.width * 0.25,
                                      height: 90,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[100].withOpacity(0.5),
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(50),
                                              bottomRight: Radius.circular(80),
                                              topRight: Radius.circular(60),
                                              topLeft: Radius.circular(30)),
                                          border: Border.all(
                                              width: 3,
                                              color: Colors.green,
                                              style: BorderStyle.none)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 25.0,
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        'Insurance',
                                        style: cardTextStyle.copyWith(fontSize: 20),
                                      ),
                                    ),
                                    Icon(FontAwesomeIcons.umbrella)
                                  ],
                                )
                              ],
                            ),
                            padding: EdgeInsets.only(left: 4),
                            margin: const EdgeInsetsDirectional.only(
                                start: 4, end: 4, top: 4),
                            height: 200,
                            width: size.width * 0.5 - 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30)),
                              //  border: Border.all(color: Colors.black.withOpacity(0.3), width: 4.0),
                              // border: Border(
                              //   left: BorderSide(
                              //     color: Colors.black.withOpacity(0.3),
                              //     width: 4.0,
                              //   ),
                              //   top: BorderSide(
                              //       color: Colors.black.withOpacity(0.3), width: 4.0),
                              //   right: BorderSide(
                              //       color: Colors.black.withOpacity(0.3), width: 4.0),
                              //   // bottom:
                              //   //     BorderSide(width: 0.0, color: Colors.transparent)
                              // ),
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    const Color(0xff23b6e6),
                                    const Color(0xff02d39a),
                                    const Color(0xFFFEC18A)
                                    // Colors.greenAccent,
                                    // Colors.greenAccent.withOpacity(0.5)
                                  ]),
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: Colors.black.withOpacity(0.2),
                              //     blurRadius: 2,
                              //     spreadRadius: 2,
                              //     // offset: Offset(0, 3),
                              //   )
                              // ]
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
             const SizedBox(height: 15.0,),
             Padding(
               padding: const EdgeInsets.only(right: 15.0),
               child: Align(
                 alignment: Alignment.bottomRight,
                 child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BnplHome()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: greenColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(34),
                                topRight: Radius.circular(34))),
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 40,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'Buy Now Pay Later',
                                  style: cardTextStyle.copyWith(fontSize: 20),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Icon(FontAwesomeIcons.shoppingCart)),
                                  height: 100,
                                  width: size.width * 0.45 - 20,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[100].withOpacity(0.5),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30))),
                                ),
                              ),
                            ],
                          ),
                          margin: const EdgeInsetsDirectional.only(
                              start: 4, end: 4, top: 4),
                          height: 200,
                          width: size.width * 0.5 - 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30)),
                            //  border: Border.all(color: Colors.black.withOpacity(0.3), width: 4.0),
                            // border: Border(
                            //   left: BorderSide(
                            //     color: Colors.black.withOpacity(0.3),
                            //     width: 4.0,
                            //   ),
                            //   top: BorderSide(
                            //       color: Colors.black.withOpacity(0.3), width: 4.0),
                            //   right: BorderSide(
                            //       color: Colors.black.withOpacity(0.3), width: 4.0),
                            //   // bottom:
                            //   //     BorderSide(width: 0.0, color: Colors.transparent)
                            // ),
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xFFFCA7E2),
                                  Color(0xFFFC9FD2),
                                  Color(0xFFFCD8BD),
                                  greenColor
                                  // Colors.greenAccent,
                                  // Colors.greenAccent.withOpacity(0.5)
                                ]),
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: Colors.black.withOpacity(0.2),
                            //     blurRadius: 2,
                            //     spreadRadius: 2,
                            //     // offset: Offset(0, 3),
                            //   )
                            // ]
                          ),
                        ),
                      ),
                    ),
               ),
             ),
           
           
          ],
        ),
      ),
    );
  }
}
