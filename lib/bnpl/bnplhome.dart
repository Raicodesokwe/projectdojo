import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:projectdojo/bnpl/gridbox.dart';
import 'package:projectdojo/bnpl/griditem.dart';
import 'package:provider/provider.dart';

class BnplHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color greenColor = const Color(0xFF00AF19);
    final gridData = Provider.of<GridBox>(context).grider;
    Size size = MediaQuery.of(context).size;
    final numberFormat = new NumberFormat("##,###.00#", "en_US");
    final TextStyle cardNumberStyle =
        GoogleFonts.openSans(fontSize: 18, fontWeight: FontWeight.w600);
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
              'Pay Later',
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
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                      // greenColor,
                      //  const Color(0xff23b6e6),
                      //                   const Color(0xff02d39a),
                      // Colors.greenAccent.withOpacity(0.3),
                     Color(0xFFFCA7E2),
                              Color(0xFFFC9FD2),
                              Color(0xFFFCD8BD),
                              
                    ]),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Credit Limit',
                        style: cardTextStyle.copyWith(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(r'ksh' + "${numberFormat.format(27802.05)}",
                          style: cardNumberStyle.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          )),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32.0))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 10.0,
                              ),
                              Icon(FontAwesomeIcons.search),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Text('Search for any store',
                                  style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15)),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 17.0,
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
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Favourite stores',
                          style: TextStyle(
                              fontFamily: 'Trueno',
                              fontWeight: FontWeight.w600,
                              fontSize: 20)),
                      Text('Show all',
                          style: TextStyle(
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w600,
                              fontSize: 12)),
                    ],
                  ),
                ),
                // const SizedBox(
                //   height: 20.0,
                // ),
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: Row(
                      children: [
                        // CircleAvatar(backgroundColor: const Color(0xFFFEC18A),radius: 30.0,child: Center(child: Icon(FontAwesomeIcons.plus),),)
                        Column(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              child: Center(child: Icon(FontAwesomeIcons.plus)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.0),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 8,
                                        spreadRadius: 6,
                                        offset: Offset(0, 3),
                                        color: Colors.black.withOpacity(0.2))
                                  ],
                                  gradient:  LinearGradient(
                                      colors: [
                                        // greenColor,
                                    Color(0xFFFCA7E2),
                              Color(0xFFFC9FD2),
                              Color(0xFFFCD8BD),
                              
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight)),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text('Add store',
                                style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12)),
                          ],
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Column(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100.0),
                                  child: Image.asset(
                                    "assets/hoteli.jpg",
                                    fit: BoxFit.cover,
                                  )),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.0),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 8,
                                        spreadRadius: 6,
                                        offset: Offset(0, 3),
                                        color: Colors.black.withOpacity(0.2))
                                  ],
                                  gradient:  LinearGradient(
                                      colors: [
                                      Color(0xFFFCA7E2),
                              Color(0xFFFC9FD2),
                              Color(0xFFFCD8BD),
                              greenColor
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight)),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text('Quickmart',
                                style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12)),
                          ],
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Column(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100.0),
                                  child: Image.asset(
                                    "assets/hoteli.jpg",
                                    fit: BoxFit.cover,
                                  )),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.0),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 8,
                                        spreadRadius: 6,
                                        offset: Offset(0, 3),
                                        color: Colors.black.withOpacity(0.2))
                                  ],
                                  gradient:  LinearGradient(
                                      colors: [
                                        
                                       Color(0xFFFCA7E2),
                              Color(0xFFFC9FD2),
                              Color(0xFFFCD8BD),
                              greenColor
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight)),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text('Jumia',
                                style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12)),
                          ],
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Column(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100.0),
                                  child: Image.asset(
                                    "assets/hoteli.jpg",
                                    fit: BoxFit.cover,
                                  )),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.0),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 8,
                                        spreadRadius: 6,
                                        offset: Offset(0, 3),
                                        color: Colors.black.withOpacity(0.2))
                                  ],
                                  gradient: const LinearGradient(
                                      colors: [
                                        const Color(0xff23b6e6),
                                        const Color(0xff02d39a),
                                        const Color(0xFFFEC18A)
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight)),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text('Miniso',
                                style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12)),
                          ],
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Column(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100.0),
                                  child: Image.asset(
                                    "assets/hoteli.jpg",
                                    fit: BoxFit.cover,
                                  )),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.0),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 8,
                                        spreadRadius: 6,
                                        offset: Offset(0, 3),
                                        color: Colors.black.withOpacity(0.2))
                                  ],
                                  gradient: const LinearGradient(
                                      colors: [
                                        const Color(0xff23b6e6),
                                        const Color(0xff02d39a),
                                        const Color(0xFFFEC18A)
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight)),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text('Nike',
                                style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: Text('What do you need?',
                      style: TextStyle(
                          fontFamily: 'Trueno',
                          fontWeight: FontWeight.w600,
                          fontSize: 20)),
                ),
                const SizedBox(height: 10.0,),
                // GridTile(child: Image.asset("assets/hoteli.jpg",fit: BoxFit.cover,),)
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(10.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3 / 2.85,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10),
                    itemBuilder: (ctx,i)=>GridItem(
                      gridData[i].title,
                      gridData[i].image
                    ),
                    itemCount: gridData.length,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
