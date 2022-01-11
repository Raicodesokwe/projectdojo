import 'package:flutter/material.dart';


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
