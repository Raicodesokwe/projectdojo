import 'package:flutter/material.dart';
import 'components/loginbody.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
class LoginPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS? CupertinoPageScaffold(child: BodyLogin()) :Scaffold(
      body: BodyLogin(),
    );
  }
}
