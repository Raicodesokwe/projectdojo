import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:projectdojo/uploadpicname/createritwa.dart';

class RitwaScreen extends StatelessWidget {
  // final Registration register;
  // RitwaScreen({Key key, @required this.register}) : super(key: key);
  final String email;
  final String password;
  final String id;
  final String currentSelectedVal;
  RitwaScreen(this.email, this.password, this.id, this.currentSelectedVal);
// RitwaScreen({Key key, @required this.email, @required this.password,@required this.id,@required this.currentSelectedVal}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: BodyRitwa(email, password, id, currentSelectedVal))
        : Scaffold(
            body: BodyRitwa(email, password, id, currentSelectedVal),
          );
  }
}
