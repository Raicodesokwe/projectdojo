import 'package:flutter/material.dart';

import 'package:projectdojo/components/createplace.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class PlacesScreen extends StatelessWidget {
 final String email;
 final String password;
 PlacesScreen(this.email,this.password);

  // final Registration register;
  // PlacesScreen({Key key, @required this.register, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS? CupertinoPageScaffold(child: BodyPlaces(email,password)): Scaffold(
      body: BodyPlaces(email,password),
    );
  }
}
