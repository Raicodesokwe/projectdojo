

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:projectdojo/components/Backgroundotp.dart';
import 'package:projectdojo/error_handler.dart';

class BodyOtp extends StatefulWidget {
  final String phoneNumber;
  final User user;
  BodyOtp(this.phoneNumber,this.user);
  @override
  _BodyOtpState createState() => _BodyOtpState();
}

class _BodyOtpState extends State<BodyOtp> {
  
  String _verificationCode;
  final FocusNode _pinPutFocusNode = FocusNode();
  //focusnode sets focus to textfield
  final TextEditingController _pinPutController = TextEditingController();
  final _kifuNguo = new GlobalKey<FormState>();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Colors.greenAccent,
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0,3)
        //changes position of shadow
      )
    ],
    //initialized at runtime and can only be ran fi a single time
    color: Colors.transparent,
    borderRadius: BorderRadius.circular(10),
    border: Border.all(color: const Color(0xFF00AF19)),
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Color greenColor = const Color(0xFF00AF19);

    return BackgroundOtp(
      child: Form(
        key: _kifuNguo,
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
            children: [
              SizedBox(
                height: 95.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Dojo',
                    style: TextStyle(fontFamily: 'Trueno', fontSize: 60.0),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Container(
                      height: 10.0,
                      width: 10.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: greenColor))
                ],
              ),
              Lottie.asset("assets/otpver.json", height: size.height * 0.3),
              Container(
                child: Center(
                  child: Text(
                    'Verify +254-${widget.phoneNumber}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    //we add a function to send the verification code to the phone number
                    //it should check whether the phone number is in the current device
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              PinPut(
                fieldsCount: 6,
                textStyle: const TextStyle(
                  fontSize: 20,
                ),
                eachFieldWidth: 40,
                eachFieldHeight: 55,
                submittedFieldDecoration: pinPutDecoration,
                selectedFieldDecoration: pinPutDecoration,
                followingFieldDecoration: pinPutDecoration,
                pinAnimationType: PinAnimationType.fade,

                focusNode: _pinPutFocusNode,
                controller: _pinPutController,
                onSubmit: (String pin) async {
                  try {
                    await widget.user
                        .linkWithCredential(PhoneAuthProvider.credential(
                            verificationId: _verificationCode, smsCode: pin))
                        .then((value) async {
                      if (value.user != null) {
                        Navigator.of(context).popUntil((route) => route.isFirst);
                        // AuthService().signOut();
                        // Navigator.popUntil(context, ModalRoute.withName('/loginpage'));
                        // Navigator.of(context).popUntil((route) => route.isFirst);
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     // builder: (context) => LoginPage()));
                      }
                    });
                  } catch (e) {
                    FocusScope.of(context).unfocus();
                    ErrorHandler().errorDialog(context, e);
                  }
                  
                },
                //called if sim isn't in user's phone but in another device thus we compare them codes
              )
            ],
          ),
        ),
      ),
    ));
  }

  _verifyPhoneNumber() async {
    //automatically types in code fi user
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+254${widget.phoneNumber}',
        //we also wanna pass the country code of the phone number
        verificationCompleted: (PhoneAuthCredential credential) async {
          await widget.user
              .linkWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              Navigator.of(context).popUntil((route) => route.isFirst);
              // AuthService().signOut();
              // Navigator.popUntil(context, ModalRoute.withName('/loginpage'));
              // Navigator.of(context)
              //     // .push(MaterialPageRoute(builder: (context) => LoginPage()));
            }
          });
        },
        //runs after sending the code
        verificationFailed: (
          FirebaseAuthException e,
        ) {
          ErrorHandler().errorDialog(context, e);
        },
        codeSent: (String verificationID, int resendToken) {
          setState(() {
            _verificationCode = verificationID;
            //store verification code into a variable that later on we can compare it with the one entered by the user
          });
        },
        //we send the code with this
        codeAutoRetrievalTimeout: (String verificationID) {
          _verificationCode = verificationID;
        },
        timeout: Duration(seconds: 120));
    //after 60 secs it resends a new code
  }

  @override
  void initState() {
    
    super.initState();
    _verifyPhoneNumber();
  }
}
