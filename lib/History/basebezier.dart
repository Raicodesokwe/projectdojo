import 'package:flutter/material.dart';
class BaseBezier extends StatelessWidget {
  final Widget child;
  const BaseBezier({
    Key key,
    @required this.size,
    @required this.greenColor, this.child,
  }) : super(key: key);

  final Size size;
  final Color greenColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.3,
      decoration: BoxDecoration(
        color: const Color(0xFFFEC18A)
        // gradient: LinearGradient(
        //     begin: Alignment.topLeft,
        //     end: Alignment.bottomCenter,
        //     colors: [
        //       greenColor,
        //       Colors.greenAccent,
        //     ]),
        
      ),
      child:  Stack(children: [
        
        Positioned(
          top: 1,
          right: 2,
            child: Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(100.0)),
             gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xFFFEC18A),
                        Colors.orangeAccent
                        
                      ]),
          ),
        )),
        Positioned(
          top: 10,
         left: 2,
            child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(100.0)),
             gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xFFFEC18A),
                        Colors.orangeAccent,
                      ]),
          ),
        )),
        Positioned(
          right: 2,
         bottom: 10,
            child: Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(100.0)),
             gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xFFFEC18A),
                        Colors.orangeAccent,
                      ]),
          ),
        )),
        Positioned(
          right: 150,
         top: 50,
            child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(100.0)),
             gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xFFFEC18A),
                        Colors.orangeAccent,
                      ]),
          ),
        )),
        Positioned(
          left: 2,
         top: 150,
            child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(100.0)),
             gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xFFFEC18A),
                        Colors.orangeAccent,
                      ]),
          ),
        )),
        child
      ]),
    );
  }
}
