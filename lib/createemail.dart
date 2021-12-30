import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:projectdojo/components/createemailbody.dart';


class MailScreen extends StatelessWidget {
  // final Registration register;
  // MailScreen({Key key, @required this.register}) : super(key: key);
  // static const routeName='/mailscreen';
  
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS? CupertinoPageScaffold(child: BodyEmails()): Scaffold(
      body: BodyEmails(),
    );
  }
}
