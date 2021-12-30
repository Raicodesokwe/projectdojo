import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'components/signupnumberbody.dart';
import 'dart:io';

class PhoneNumberSignup extends StatelessWidget {
//  final Registration register;
//   PhoneNumberSignup({Key key, @required this.register}) : super(key: key);
    final String email;
final String password;
final String id;
final String currentSelectedVal;
final File imgFile;
final String name;
final String firstname;
final String secondname;
final String dob;
PhoneNumberSignup(this.email,this.password,this.id,this.currentSelectedVal,this.imgFile,this.name,this.firstname,this.secondname,this.dob);
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS? CupertinoPageScaffold(child: BodyNumber(email,password,id,currentSelectedVal,imgFile,name,firstname,secondname,dob)): Scaffold(
      body: BodyNumber(email,password,id,currentSelectedVal,imgFile,name,firstname,secondname,dob),
    );
  }
}
