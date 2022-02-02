import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import 'package:projectdojo/alpaca/account.dart';
import 'package:projectdojo/alpaca/trading.dart';
import 'package:projectdojo/loginpage.dart';

import 'package:projectdojo/pages/investments.dart';
import 'package:projectdojo/pages/moreservices.dart';
import 'package:projectdojo/pages/profile.dart';
import 'package:projectdojo/pages/savings.dart';
import 'package:projectdojo/services/authservice.dart';

import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:projectdojo/stonks/search.dart';

import 'package:shimmer/shimmer.dart';
import '../services/changethemebutton.dart';
import 'homecardsstacked.dart';
import 'homedrop.dart';
import 'homesave.dart';
import 'homeshimmer.dart';
import 'homestack.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;

  int pageIndex = 0;

  final pages = [Investments(), MoreServices(), Savings(), Profile()];
  Future dino;
  //currentuser acts as a property not a future and returns currentuser object synchronously
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dino = TradingService().getAccount(context);
    fambo = FirebaseFirestore.instance.collection('users').doc(user.uid).get();
  }

  Future fambo;

  @override
  Widget build(BuildContext context) {
    final BoxDecoration decorator = BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        border: Border.all(color: Colors.black.withOpacity(0.5), width: 4.0),
        gradient: const LinearGradient(colors: [
          const Color(0xff23b6e6),
          const Color(0xff02d39a),
          const Color(0xFFFEC18A)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight));
    final TextStyle cardTextStyle =
        GoogleFonts.spartan(color: Colors.white, fontWeight: FontWeight.w600);
    final TextStyle cardNumberStyle =
        GoogleFonts.openSans(fontSize: 18, fontWeight: FontWeight.w600);

    final numberFormat = new NumberFormat("##,###.00#", "en_US");
    Size size = MediaQuery.of(context).size;
    Color greenColor = const Color(0xFF00AF19);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            width: 159,
            child: FutureBuilder(
              future: fambo,
              builder: (ctx, snapshot) {
                if (!snapshot.hasData ||
                    snapshot.data == null ||
                    snapshot.hasError ||
                    snapshot.connectionState == ConnectionState.waiting) {
                  return Shimmer.fromColors(
                    baseColor: Colors.green[300],
                    highlightColor: Colors.green[100],
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.green[300],
                    ),
                  );
                } else {
                  final documents = snapshot.data;
                  return Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 2,
                                spreadRadius: 2,
                                color: Colors.black.withOpacity(0.2))
                          ],
                        ),
                        child: CircleAvatar(
                          foregroundColor: Colors.green[300],
                          backgroundImage: NetworkImage(documents['image_url']),
                          radius: 20,
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Text(
                        'Hi ${documents['name']}',
                        style: GoogleFonts.spartan(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Theme.of(context).textTheme.headline6.color),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            HomeDrop(),
            const SizedBox(
              width: 5,
            )
          ],
        ),
        body: FutureBuilder<Account>(
            future: dino,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Lottie.asset("assets/fofoerror.json",
                      height: size.height * 0.5),
                );
              } else if (!snapshot.hasData) {
                return HomeShimmer(
                  size: size,
                );
              }
              return SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BaseInvest(
                          size: size,
                          greenColor: greenColor,
                          numberFormat: numberFormat,
                          cardNumberStyle: cardNumberStyle,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Cash Available',
                                    style: TextStyle(
                                        fontFamily: 'Trueno',
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600)),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                    r'$' +
                                        "${numberFormat.format(double.parse(snapshot.data.cash))}",
                                    style: cardNumberStyle.copyWith(
                                        color: Colors.black)),
                              ],
                            ),
                          ),
                        ),
                        MonthlySave(
                          size: size,
                          greenColor: greenColor,
                          numberFormat: numberFormat,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Portofolio value',
                                    style: TextStyle(
                                        fontFamily: 'Trueno',
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600)),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  r'$' +
                                      "${numberFormat.format(double.parse(snapshot.data.portfolioValue))}",
                                  style: GoogleFonts.openSans(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Text('My money',
                        style: GoogleFonts.spartan(
                            fontWeight: FontWeight.w600, fontSize: 18)),

                    HomeCardsStacked(
                        decorator: decorator,
                        cardTextStyle: cardTextStyle,
                        numberFormat: numberFormat,
                        cardNumberStyle: cardNumberStyle,
                        greenColor: greenColor,
                        size: size),
                    // ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
