import 'package:flutter/material.dart';
import 'dart:io';
import 'package:projectdojo/components/detailsbody.dart';
import 'package:flutter/cupertino.dart';


class DeetsScreen extends StatelessWidget {
  // final Registration register;
  // DeetsScreen({Key key, @required this.register}) : super(key: key);
final String email;
final String password;
final String id;
final String currentSelectedVal;
final File imgFile;
final String name;
DeetsScreen(this.email,this.password,this.id,this.currentSelectedVal,this.imgFile,this.name);
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoPageScaffold(child: BodyDetails(email,password,id,currentSelectedVal,imgFile,name))
        : Scaffold(
            body: BodyDetails(email,password,id,currentSelectedVal,imgFile,name),
          );
  }
}
