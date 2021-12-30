import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NyumaButton extends StatelessWidget {
  const NyumaButton({Key key, this.size, this.percent}) : super(key: key);
  final Size size;
  final double percent;
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: size.height * 0.015,
        left: 15,
        child: Padding(
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
                    // size: 30,
                    color: percent < .56
                        ? Colors.white.withOpacity(1 - percent)
                        : Colors.black,
                  ),
                ))));
  }
}
