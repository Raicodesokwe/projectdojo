import 'package:flutter/material.dart';

class BackgroundRitwa extends StatelessWidget {
  
  final Widget child;
  const BackgroundRitwa({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
   
    return Container(
      
      height: size.height,
      width: double.infinity,
      child: Stack(
        
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/bottomleft.png",
              width: size.width * 0.6,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              "assets/bottomright.png",
              width: size.width * 0.5,
            ),
          ),
          child
        ],
      ),
    );
  }
}
