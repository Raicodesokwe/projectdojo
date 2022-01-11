import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:flutterwave/flutterwave.dart';
import 'package:projectdojo/loginpage.dart';

import 'package:projectdojo/pages/investments.dart';
import 'package:projectdojo/pages/moreservices.dart';
import 'package:projectdojo/pages/profile.dart';
import 'package:projectdojo/pages/savings.dart';
import 'package:projectdojo/services/authservice.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterwave/models/responses/charge_response.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:shimmer/shimmer.dart';
import '../services/changethemebutton.dart';
import 'homesave.dart';
import 'homestack.dart';

class HomePage extends StatefulWidget {
  // final User user;
  // final bool wantsTouchId;
  // final String password;

  // HomePage({this.user, this.wantsTouchId, this.password});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;
  final String txref = "My_unique_transaction_reference_123";
  final String amount = "200";
  final String currency = FlutterwaveCurrency.KES;
  int pageIndex = 0;

  final pages = [Investments(), MoreServices(), Savings(), Profile()];
  //currentuser acts as a property not a future and returns currentuser object synchronously

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
      child: Platform.isIOS
          ? CupertinoPageScaffold()
          : Scaffold(
              appBar: AppBar(
                title: Container(
                  width: 159,
                  child: Row(
                    children: [
                      FutureBuilder(
                        
                        future: FirebaseFirestore.instance
                            .collection('users')
                            .doc(user.uid)
                            .get(),
                        builder: (ctx, snapshot) {
                          if (!snapshot.hasData ||
                              snapshot.data == null ||
                              snapshot.hasError ||
                              snapshot.connectionState ==
                                  ConnectionState.waiting) {
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
                            return Container(
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
                                backgroundImage:
                                    NetworkImage(documents['image_url']),
                                radius: 20,
                              ),
                            );
                            // CircleAvatar(
                            //   radius: 24,
                            //   backgroundImage: NetworkImage(documents['image_url']),
                            // );
                          }
                        },
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Text(
                        'Hi Ricko',
                        style: GoogleFonts.spartan(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Theme.of(context).textTheme.headline6.color),
                      ),
                    ],
                  ),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [
                  DropdownButton(
                    underline: Container(),
                    onChanged: (onitem) {
                      //this function gets the item identifier which is the value we specified in the value parameter
                      if (onitem == 'logout') {
                        AuthService().signOut();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                        //firebase db rules for security
                        //lock db down to only authenticated users
                        //we need scrollable list of eixsting messages
                      }
                      if (onitem == 'Deposit') {
                        beginPayment();
                        // AuthService().signOut();
                        //firebase db rules for security
                        //lock db down to only authenticated users
                        //we need scrollable list of eixsting messages
                      }
                    },
                    items: [
                      //value acts as an identifier
                      DropdownMenuItem(
                          value: 'logout',
                          child: Container(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.exit_to_app,
                                  color: Colors.green[300],
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text('Logout')
                              ],
                            ),
                          )),
                      DropdownMenuItem(
                          value: 'Deposit',
                          child: Container(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add,
                                  color: Colors.green[300],
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text('Deposit')
                              ],
                            ),
                          )),
                      DropdownMenuItem(
                          value: 'Dark',
                          child: Container(
                            child: Row(
                              children: [
                                ChangeThemeButtonWidget(),
                                SizedBox(
                                  width: 8,
                                ),
                                Text('Dark')
                              ],
                            ),
                          ))
                    ],
                    icon: Container(
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
                  ),
                  const SizedBox(
                    width: 5,
                  )
                ],
              ),
              body: SingleChildScrollView(
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Total investments',
                                  style: TextStyle(
                                      fontFamily: 'Trueno',
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Text(r'ksh' + "${numberFormat.format(27802.05)}",
                                  style: cardNumberStyle),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Container(
                                  height: 48.0,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 32.0, vertical: 4.0),
                                  child: Sparkline(
                                    // fillColor: Colors.black12,
                                    // sharpCorners: false,
                                    // sharpCorners: false,
                                    // fillColor: Colors.black12,
                                    data: const [
                                      0.0,
                                      0.3,
                                      0.2,
                                      0.4,
                                      0.3,
                                      0.2,
                                      0.3
                                    ],
                                    lineWidth: 3.5,
                                    lineColor: Colors.black,
                                  )),
                            ],
                          ),
                        ),
                        MonthlySave(
                          size: size,
                          greenColor: greenColor,
                          numberFormat: numberFormat,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Monthly savings',
                                  style: TextStyle(
                                      fontFamily: 'Trueno',
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                r'ksh' + "${numberFormat.format(27802.05)}",
                                style: GoogleFonts.openSans(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Container(
                                  height: 48.0,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 32.0, vertical: 4.0),
                                  child: Sparkline(
                                    fillColor: Colors.black12,
                                    sharpCorners: false,
                                    data: const [
                                      0.0,
                                      0.1,
                                      0.3,
                                      0.2,
                                      0.0,
                                      0.1,
                                      0.2
                                    ],
                                    lineWidth: 3.5,
                                    lineColor: Colors.black,
                                  ))
                            ],
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
                    // Container(
                    //   width: double.infinity,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(30),
                    //     boxShadow: [
                    //       BoxShadow(
                    //           offset: Offset(0, 3),
                    //           blurRadius: 2,
                    //           spreadRadius: 2,
                    //           color: Colors.black.withOpacity(0.2))
                    //     ],
                    //   ),
                    //   // padding: EdgeInsets.all(4.0),
                    //   child:
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      height: 380.0,
                      child: Stack(
                        children: [
                          Container(
                            height: 140.0,
                            decoration: decorator,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Investments', style: cardTextStyle),
                                  Text(
                                      r'ksh' +
                                          "${numberFormat.format(27802.05)}",
                                      style: cardNumberStyle),
                                ],
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
                                    Text('Savings', style: cardTextStyle),
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
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Buy Now Pay Later',
                                            style: cardTextStyle,
                                          ),
                                          const SizedBox(
                                            height: 10.0,
                                          ),
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                  backgroundColor: greenColor,
                                                  child: const Icon(
                                                    Icons.add,
                                                    size: 23.0,
                                                  )),
                                              const SizedBox(
                                                width: 5.0,
                                              ),
                                              Text(
                                                'Start shopping',
                                                style: TextStyle(
                                                    fontFamily: 'Trueno',
                                                    color: Colors.white),
                                              )
                                            ],
                                          )
                                        ],
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
                    ),
                    // ),
                  ],
                ),
              ),
            ),
    );
  }

  beginPayment() async {
    final Flutterwave flutterwave = Flutterwave.forUIPayment(
        context: this.context,
        encryptionKey: "204dcfeb576f86b2ab665784",
        publicKey: "FLWPUBK-5f34432d2b45fd2cf799c267e044cc93-X",
        currency: this.currency,
        amount: this.amount,
        email: "test20@test.com",
        fullName: "Wadiya Songok",
        txRef: this.txref,
        isDebugMode: false,
        phoneNumber: "0123456789",
        acceptCardPayment: true,
        acceptUSSDPayment: false,
        acceptAccountPayment: false,
        acceptFrancophoneMobileMoney: false,
        acceptGhanaPayment: false,
        acceptMpesaPayment: true,
        acceptRwandaMoneyPayment: false,
        acceptUgandaPayment: false,
        acceptZambiaPayment: false);

    try {
      final ChargeResponse response =
          await flutterwave.initializeForUiPayments();
      if (response == null) {
        // ErrorHandler().errorDialog(context, "transaction unsuccessful");
        // user didn't complete the transaction. Payment wasn't successful.
      } else {
        final isSuccessful = checkPaymentIsSuccessful(response);
        if (isSuccessful) {
          // SuccessHandler().successDialog(context, "Transaction successful");
          // provide value to customer
        } else {
          // check message
          // ErrorHandler().errorDialog(context, response);
          print(response);

          // check status

          print(response.status);

          // check processor error
          // ErrorHandler().errorDialog(context, response.data.processorResponse);
          print(response.data.processorResponse);
        }
      }
    } catch (error, stacktrace) {
      // ErrorHandler().errorDialog(context, error);
      // handleError(error);
      print(stacktrace);
    }
  }

  bool checkPaymentIsSuccessful(final ChargeResponse response) {
    return response.data.status == FlutterwaveConstants.SUCCESSFUL &&
        response.data.currency == this.currency &&
        response.data.amount == this.amount &&
        response.data.txRef == this.txref;
  }
}
