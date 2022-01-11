import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'components/signupnumberbody.dart';
import 'dart:io';

class PhoneNumberSignup extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Platform.isIOS? CupertinoPageScaffold(child: BodyNumber()): Scaffold(
      body: BodyNumber(),
    );
  }
}
