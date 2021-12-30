import 'package:animations/animations.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:projectdojo/mucii/home_page.dart';
import 'package:projectdojo/pages/investments.dart';
import 'package:projectdojo/pages/moreservices.dart';
import 'package:projectdojo/pages/profile.dart';
import 'package:projectdojo/pages/savings.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int pageIndex = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final pages = [
    HomePage(),
    Investments(),
    MoreServices(),
    Savings(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: PageTransitionSwitcher(
          duration: Duration(seconds: 1),
          transitionBuilder: (child, animation, secondaryAnimation) =>
              FadeThroughTransition(
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                child: child,
              ),
          child: pages[pageIndex]),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        color: Colors.transparent,
        backgroundColor: Colors.transparent,
        height: 50,
        items: [
          Lottie.asset("assets/homeicon.json", height: size.height * 0.05),
          Lottie.asset("assets/graph.json", height: size.height * 0.05),
          Lottie.asset("assets/plus.json", height: size.height * 0.05),
          Lottie.asset("assets/save.json", height: size.height * 0.05),
          Lottie.asset("assets/profile.json", height: size.height * 0.05),
        ],
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        animationDuration: Duration(milliseconds: 200),
        animationCurve: Curves.bounceInOut,
        index: pageIndex,
      ),
    );
  }
}
