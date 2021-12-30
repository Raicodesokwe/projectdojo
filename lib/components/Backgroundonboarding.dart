import 'package:flutter/material.dart';

class BackgroundOnboarding extends StatelessWidget {
  final Widget child;
  const BackgroundOnboarding({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Color greenColor = const Color(0xFF00AF19);
    return Container(
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
      child: Stack(
        alignment: Alignment.center,
        children: [child],
      ),
      
    );
  }
}
