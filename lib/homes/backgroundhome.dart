import 'package:flutter/material.dart';

class BackgroundHome extends StatelessWidget {
  const BackgroundHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      top: 0,
      child: Image(
        image: AssetImage(
          "assets/hoteli.jpg",
        ),
        fit: BoxFit.cover,
      ),
    );
  }
}
