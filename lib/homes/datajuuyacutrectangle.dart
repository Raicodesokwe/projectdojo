import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectdojo/equity/custombottomdescription.dart';
import 'package:projectdojo/homes/chinidescription.dart';

class DataTopOfCutRectangle extends StatelessWidget {
  const DataTopOfCutRectangle({Key key, this.size, this.percent}) : super(key: key);
  final Size size;
  final double percent;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: size.width * 0.34, top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: percent > 0.13
                    ? size.width * pow(percent, 5.5).clamp(0.0, 0.2)
                    : 0,
                top: size.height *
                    (percent > 0.48
                        ? pow(percent, 10.5).clamp(0.0, 0.06)
                        : 0.0)),
            child: Text(
              'Four bedroom townhouse',
              textAlign: TextAlign.start,
              // overflow: TextOverflow.ellipsis,
              style: GoogleFonts.bigShouldersText(
                  fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          if (percent < 0.50) ...[
            const SizedBox(
              height: 2,
            ),
            AnimatedOpacity(
                opacity: 1 - pow(percent, 0.01),
                child: const CustomChiniDescription(),
                duration: const Duration(milliseconds: 200))
          ]
        ],
      ),
    );
  }
}
