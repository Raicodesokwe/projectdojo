import 'dart:io';

import 'package:google_fonts/google_fonts.dart';

import 'package:projectdojo/createemail.dart';

import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

import 'package:projectdojo/allaboard.dart/onboarding.dart';

import 'package:provider/provider.dart';

class BodyOnboarder extends StatefulWidget {
  @override
  _BodyOnboarderState createState() => _BodyOnboarderState();
}

class _BodyOnboarderState extends State<BodyOnboarder> {
  int currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0,viewportFraction: 0.99);
  @override
  Widget build(BuildContext context) {
    Color greenColor = const Color(0xFF00AF19);
    Size size = MediaQuery.of(context).size;
    final contentsData=Provider.of<Onboarder>(context).contents;
  
    // Registration register=new Registration(null, null, dob, firstname, null, null, null, null, null, secondname);
    //provides total height and width of our screen
    // register.firstname=firstname;
    // register.secondname=secondname;
    // register.dob=dob;
    return Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              greenColor,
              Colors.lightGreen,
              Colors.green[300],
              Colors.green[100],
            ],
                stops: [
              0.2,
              0.4,
              0.6,
              0.75
            ])),
        child: PageView.builder(
          physics: AlwaysScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          itemBuilder: (_, i) {
            return ChangeNotifierProvider.value(
              value: contentsData[i],
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 25.0,
                  right: 25.0,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Lottie.asset(contentsData[i].image, height: size.height * 0.6),
                      Text(
                        contentsData[i].title,
                        style: const TextStyle(
                            fontFamily: 'Trueno',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      Text(
                        contentsData[i].description,
                        style: GoogleFonts.bigShouldersText(
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              contentsData.length, (index) => buildDot(index)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: contentsData.length,
        ),
      ),
      bottomSheet: Container(
        height: Platform.isIOS ? 70 : 60,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              greenColor,
              Colors.lightGreen,
              Colors.green[300],
              Colors.green[100],
            ],
                stops: [
              0.1,
              0.1,
              0.2,
              0.1
            ])),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MailScreen(
                          // register: newRegister
                          )));
                },
                child: const Text(
                  'Skip',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                )),
            InkWell(
                onTap: () {
                  if (currentIndex == contentsData.length - 1) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MailScreen(
                            // register: newRegister
                            )));
                  }
                  _pageController.nextPage(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.bounceIn);
                },
                child: Text(
                  currentIndex == contentsData.length - 1 ? 'Sign Up' : 'Next',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
    );
  }

  Container buildDot(int index) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            20,
          ),
          color: Colors.black),
    );
  }
}
