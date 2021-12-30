import 'package:flutter/material.dart';
import 'components/changepass.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';

class PassChangeScreen extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return  Platform.isIOS?CupertinoPageScaffold(child: BodyPassChange()):Scaffold(body: BodyPassChange(),);
  }
}