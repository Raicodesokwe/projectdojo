import 'package:flutter/material.dart';


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color greenColor = const Color(0xFF00AF19);
    Size size = MediaQuery.of(context).size;
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Dojo',
                  style: TextStyle(
                      fontFamily: 'Trueno',
                      fontSize: 70.0,
                      color: Colors.white),
                ),
                SizedBox(
                  width: size.width * 0.03,
                ),
                Container(
                    height: 15.0,
                    width: 15.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
