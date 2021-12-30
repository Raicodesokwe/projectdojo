
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'components/otpsignup.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';

class OtpScreen extends StatelessWidget {
  final String phoneNumber;
  final User user;
  OtpScreen(this.phoneNumber,this.user);
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Platform.isIOS? CupertinoPageScaffold(child: BodyOtp(phoneNumber)): BodyOtp(phoneNumber),
    // );
    return Platform.isIOS?CupertinoPageScaffold(child: BodyOtp(phoneNumber,user)):Scaffold(body: BodyOtp(phoneNumber,user),);
  }
}