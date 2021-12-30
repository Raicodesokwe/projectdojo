import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextStyle cardTextStyle =
        GoogleFonts.spartan( fontWeight: FontWeight.w600,fontSize: 18);
    final user = FirebaseAuth.instance.currentUser;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Center(
                child: Text('User Profile',
                    style: TextStyle(
                        fontFamily: 'Trueno',
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Theme.of(context).textTheme.headline6.color)),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        FutureBuilder(
                          future: FirebaseFirestore.instance
                              .collection('users')
                              .doc(user.uid)
                              .get(),
                          builder: (ctx, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Shimmer.fromColors(
                                baseColor: Colors.green[300],
                                highlightColor: Colors.green[100],
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.green[300],
                                ),
                              );
                            } else {
                              final documents = snapshot.data;
                              return Container(
                              //  height: 32,
                              //  width: 32,
                               margin: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  // shape: BoxShape.circle,
                                  borderRadius: BorderRadius.circular(30),
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
                                  radius: 30,
                                ),
                              );
                              // CircleAvatar(
                              //   radius: 24,
                              //   backgroundImage: NetworkImage(documents['image_url']),
                              // );
                            }
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Ricko',
                          style: TextStyle(fontFamily: 'Trueno', fontSize: 20),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    // Container(
                    //   height: 100,
                    //   width: 200,
                    //   // color: Colors.red,
                    //   // height: 30,
                    //   child:
                       Column(
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Your',
                            style: TextStyle(
                                fontFamily: 'Trueno',
                                fontWeight: FontWeight.w800,
                                fontSize: 25),
                          ),
                          const SizedBox(height: 5,),
                          Text(
                            'Details',
                            style: cardTextStyle,
        
                          )
                        ],
                      ),
                    // )
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            height: 54.0,
                            width: 54.0,
                            decoration: BoxDecoration(
                                color: Colors.red[100].withOpacity(0.3),
                                borderRadius: BorderRadius.circular(18.0)),
                            child: Center(
                              child: Icon(FontAwesomeIcons.userCircle,color: Colors.red,)
                            )),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'Profile',
                          style: GoogleFonts.bigShouldersText(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                    Container(
                        height: 54.0,
                        width: 54.0,
                        decoration: BoxDecoration(
                            color: Colors.greenAccent.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(18.0)),
                        child: Center(
                          child: Icon(FontAwesomeIcons.handPointRight)
                        )),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            height: 54.0,
                            width: 54.0,
                            decoration: BoxDecoration(
                                color: Colors.cyanAccent [100].withOpacity(0.3),
                                borderRadius: BorderRadius.circular(18.0)),
                            child: Center(
                              child: Icon(FontAwesomeIcons.users,color: Colors.cyan,),
                            )),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'Refer and earn',
                          style: GoogleFonts.bigShouldersText(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ],
                    ),
                    Container(
                        height: 54.0,
                        width: 54.0,
                        decoration: BoxDecoration(
                            color: Colors.greenAccent.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(18.0)),
                        child: Center(
                          child: Icon(FontAwesomeIcons.handPointRight),
                        )),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            height: 54.0,
                            width: 54.0,
                            decoration: BoxDecoration(
                                color: Colors.blue[100].withOpacity(0.3),
                                borderRadius: BorderRadius.circular(18.0)),
                            child: Center(
                              child: Icon(FontAwesomeIcons.wrench,color: Colors.blue,),
                            )),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'Settings',
                          style: GoogleFonts.bigShouldersText(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                    Container(
                        height: 54.0,
                        width: 54.0,
                        decoration: BoxDecoration(
                            color: Colors.greenAccent.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(18.0)),
                        child: Center(
                          child: Icon(FontAwesomeIcons.handPointRight)
                        )),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            height: 54.0,
                            width: 54.0,
                            decoration: BoxDecoration(
                                color: Colors.lightGreen[100].withOpacity(0.3),
                                borderRadius: BorderRadius.circular(18.0)),
                            child: Center(
                              child:Icon(FontAwesomeIcons.arrowCircleDown,color: Colors.lightGreen,),
                            )),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'Withdraw',
                          style: GoogleFonts.bigShouldersText(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ],
                    ),
                    Container(
                        height: 54.0,
                        width: 54.0,
                        decoration: BoxDecoration(
                            color: Colors.greenAccent.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(18.0)),
                        child: Center(
                          child: Icon(FontAwesomeIcons.handPointRight),
                        )),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            height: 54.0,
                            width: 54.0,
                            decoration: BoxDecoration(
                                color: Colors.lime[100].withOpacity(0.3),
                                borderRadius: BorderRadius.circular(18.0)),
                            child: Center(
                              child: Icon(FontAwesomeIcons.plusCircle,color: Colors.lime,),
                            )),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'Deposit',
                          style: GoogleFonts.bigShouldersText(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ],
                    ),
                    Container(
                        height: 54.0,
                        width: 54.0,
                        decoration: BoxDecoration(
                            color: Colors.greenAccent.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(18.0)),
                        child: Center(
                          child: Icon(FontAwesomeIcons.handPointRight),
                        )),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            height: 54.0,
                            width: 54.0,
                            decoration: BoxDecoration(
                                color: Colors.orange [100].withOpacity(0.3),
                                borderRadius: BorderRadius.circular(18.0)),
                            child: Center(
                              child: Icon(FontAwesomeIcons.envelopeOpenText,color: Colors.orange,),
                            )),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'Live chat',
                          style: GoogleFonts.bigShouldersText(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ],
                    ),
                    Container(
                        height: 54.0,
                        width: 54.0,
                        decoration: BoxDecoration(
                            color: Colors.greenAccent.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(18.0)),
                        child: Center(
                          child: Icon(FontAwesomeIcons.handPointRight),
                        )),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            height: 54.0,
                            width: 54.0,
                            decoration: BoxDecoration(
                                color: Colors.pink [100].withOpacity(0.3),
                                borderRadius: BorderRadius.circular(18.0)),
                            child: Center(
                              child: Icon(FontAwesomeIcons.questionCircle,color: Colors.pink,),
                            )),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'FAQs',
                          style: GoogleFonts.bigShouldersText(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ],
                    ),
                    Container(
                        height: 54.0,
                        width: 54.0,
                        decoration: BoxDecoration(
                            color: Colors.greenAccent.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(18.0)),
                        child: Center(
                          child: Icon(FontAwesomeIcons.handPointRight),
                        )),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            height: 54.0,
                            width: 54.0,
                            decoration: BoxDecoration(
                                color: Colors.purple [100].withOpacity(0.3),
                                borderRadius: BorderRadius.circular(18.0)),
                            child: Center(
                              child: Icon(FontAwesomeIcons.file,color: Colors.purple,),
                            )),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'Statement',
                          style: GoogleFonts.bigShouldersText(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ],
                    ),
                    Container(
                        height: 54.0,
                        width: 54.0,
                        decoration: BoxDecoration(
                            color: Colors.greenAccent.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(18.0)),
                        child: Center(
                          child: Icon(FontAwesomeIcons.handPointRight),
                        )),
                  ],
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
