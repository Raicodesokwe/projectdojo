import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CustomBottomDescription extends StatelessWidget {
  const CustomBottomDescription({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Kiambu',
          style: TextStyle(
              fontFamily: 'Lato', fontWeight: FontWeight.w100, fontSize: 15),
        ),
        
      ],
    );
  }
}
