import 'package:flutter/material.dart';


class CustomChiniDescription extends StatelessWidget {
  const CustomChiniDescription({Key key}) : super(key: key);

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
