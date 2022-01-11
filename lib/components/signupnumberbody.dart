// import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:country_code_picker/country_code_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:projectdojo/otp.dart';
// import 'package:projectdojo/components/Background.dart';
// import 'package:lottie/lottie.dart';
// import 'package:projectdojo/services/authservice.dart';
// import 'package:projectdojo/error_handler.dart';
// import 'dart:io';

// class BodyNumber extends StatefulWidget {
// final String email;
// final String password;
// final String id;
// final String currentSelectedVal;
// final File imgFile;
// final String name;
// final String firstname;
// final String secondname;
// final String dob;
// BodyNumber(this.email, this.password, this.id, this.currentSelectedVal,
//     this.imgFile, this.name, this.firstname, this.secondname, this.dob);

//   @override
//   _BodyNumberState createState() => _BodyNumberState();
// }

// class _BodyNumberState extends State<BodyNumber> {
//   checkFields() {
//     final form = _kweche.currentState;
//     if (form.validate()) {
//       FocusScope.of(context).unfocus();
//       form.save();
//       return true;
//     }
//     return false;
//   }

//   bool isLoading = false;
//   String validatePhoneNumber(String value) {
//     if (value.length != 10) {
//       return 'Please enter a valid phone number';
//     }
//     return null;
//   }

//   final _kweche = GlobalKey<FormState>();
// User user;
// String email,
//     password,
//     phonenumber,
//     id,
//     currentSelectedVal,
//     name,
//     firstname,
//     secondname,
//     dob;

//   final TextEditingController _phoneNumberController =
//       new TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     // Registration register=new Registration(null, null, null, null, null, null, null, null, phonenumber, null);
//     // register.phonenumber=phonenumber;
//     Size size = MediaQuery.of(context).size;
//     Color greenColor = const Color(0xFF00AF19);
//     //provides total height and width of our screen
//     return Background(
//       child: Form(
//         key: _kweche,
//         child: Padding(
//           padding: const EdgeInsets.only(left: 25.0, right: 25.0),
//           child: SingleChildScrollView(
//             reverse: true,
//             child: Column(
//             children: [
//               SizedBox(
//                 height: 95.0,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Dojo',
//                     style: TextStyle(fontFamily: 'Trueno', fontSize: 60.0),
//                   ),
//                   SizedBox(
//                     width: 10.0,
//                   ),
//                   Container(
//                       height: 10.0,
//                       width: 10.0,
//                       decoration: BoxDecoration(
//                           shape: BoxShape.circle, color: greenColor))
//                 ],
//               ),
//               Lottie.asset("assets/contact.json", height: size.height * 0.3),
//               Row(
//                 children: [
//                   Expanded(
//                       //expanded widget helps us fill rows and columns

//                       child: CountryCodePicker(
//                     initialSelection: 'KE',
//                     enabled: false,
//                     hideMainText: true,
//                     //only flag shown
//                   )),
//                   Expanded(
//                     flex: 3,
//                     //controls the size ofthe children of the row in expanded widgets to cover the whole row
//                     child: TextFormField(
//                       controller: _phoneNumberController,
//                       validator: (value) => value.isEmpty
//                           ? 'Phone number is required'
//                           : validatePhoneNumber(value),
//                       decoration: InputDecoration(
//                           labelText: 'Phone Number',
//                           prefix: Padding(
//                             padding: EdgeInsets.all(4),
//                             child: Text('+254'),
//                           ),
//                           labelStyle: TextStyle(
//                               fontFamily: 'Trueno',
//                               fontSize: 12.0,
//                               color: Colors.grey.withOpacity(0.5)),
//                           focusedBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(color: greenColor),
//                           )),
//                       maxLength: 10,
//                       keyboardType: TextInputType.number,
//                       //controller handles changes to a textfield
//                       //u can use onchanged or controller
//                       //controller is a more elaborate way to handle changes to a textfield
//                       //we call dispose to clea off controller from widget field
//                       onChanged: (value) {
//                         this.phonenumber = value;
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 45.0,
//               ),
//               GestureDetector(
//                 onTap: () async {
//                   if (checkFields()) {
//                     setState(() {
//                       isLoading = true;
//                     });
// UserCredential authResult;

// authResult = await FirebaseAuth.instance
//     .createUserWithEmailAndPassword(
//         email: widget.email, password: widget.password)
//     .catchError((e) {
//   ErrorHandler().errorDialog(context, e);
// });

// final ref = FirebaseStorage.instance
//     .ref()
//     .child('user_images')
//     .child(authResult.user.uid + '.jpg');
// await ref.putFile(widget.imgFile).catchError((e) {
//   ErrorHandler().errorDialog(context, e);
// });
// final url = await ref.getDownloadURL().catchError((e) {
//   ErrorHandler().errorDialog(context, e);
// });

// await FirebaseFirestore.instance
//     .collection('users')
//     .doc(authResult.user.uid)
//     .set({
//   //     //set stores extra user data in a map
//   'email': widget.email,
//   'image_url': url,
//   'id': widget.id,
//   'currentSelectedVal': widget.currentSelectedVal,
//   'name': '\$' + widget.name,
//   'firstname': widget.firstname,
//   'secondname': widget.secondname,
//   'dob': widget.dob,
//   'phonenumber': _phoneNumberController.text,
// }).catchError((e) {
//   ErrorHandler().errorDialog(context, e);
//   setState(() {
//     isLoading = false;
//   });
// });
//                     setState(() {
//                       isLoading = false;
//                     });
//                     // Navigator.of(context).push(
//                     //     MaterialPageRoute(builder: (context) => HomePage()));

//                     // AuthService()
//                     //     .signUp(email, imgFile, password, id, currentSelectedVal,
//                     //         name, firstname, secondname, dob, phonenumber)
//                     //     .catchError((e) {
//                     //   ErrorHandler().errorDialog(context, e);
//                     // });
//                     // AuthService()
//                     //     .signUp(
//                     //   email,

//                     //   //removes excess whitespace at the beginning or end
//                     //   password,
//                     //   // id,
//                     //   // currentSelectedVal,
//                     //   // name,
//                     //   // firstname,
//                     //   // secondname,
//                     //   // dob,
//                     //   // phonenumber.trim()
//                     // )
//                     //     .then((authResult) {
//                     //   FirebaseFirestore.instance
//                     //       .collection('users')
//                     //       .doc(authResult.user.uid)
//                     //       .set({'phonenumber': phonenumber});
//                     // }).then((res) {
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => OtpScreen(
//                             _phoneNumberController.text, authResult.user)));
//                   }

//                   // }).catchError((e) {
//                   //   ErrorHandler().errorDialog(context, e);
//                   // });
//                 },
//                 child: Container(
//                   height: 50.0,
//                   child: Material(
//                     borderRadius: BorderRadius.circular(20.0),
//                     shadowColor: Colors.greenAccent,
//                     color: greenColor,
//                     elevation: 7.0,
                    // child: Center(
                    //   child: isLoading
                    //       ? Shimmer.fromColors(
                    //           baseColor: Colors.green[300],
                    //           highlightColor: Colors.green[100],
                    //           child: Container(
                    //             height: 50,
                    //             width: double.infinity,
                    //             decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(20.0),
                    //               color: Colors.green[300],
                    //             ),
                    //           ),
                    //         )
                    //       : const Text(
                    //           'NEXT',
                    //           style: TextStyle(
                    //               color: Colors.white, fontFamily: 'Trueno'),
                    //         ),
                    // ),
                  // ),
//                   //materialapp widget is a wrapper of other flutter widgets
//                   //material widget clips to a shape
//                   //it elevates its widget subtree along z axis
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ));
//   }
// }

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pin_put/pin_put.dart';

import 'package:projectdojo/services/navbar.dart';

import 'package:shimmer/shimmer.dart';

enum MobileVerificationState { SHOW_MOBILE_FORM_STATE, SHOW_OTP_FORM_STATE }

class BodyNumber extends StatefulWidget {
  @override
  State<BodyNumber> createState() => _BodyNumberState();
}

class _BodyNumberState extends State<BodyNumber> {
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;
  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  User _auth = FirebaseAuth.instance.currentUser;
  UserCredential authA;
  String verificationId;

  bool showLoading = false;
  User user;

  Color greenColor = const Color(0xFF00AF19);

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });
    try {
      final authCredential =
          await _auth.linkWithCredential(phoneAuthCredential);
      setState(() {
        showLoading = false;
      });
      if (authCredential.user != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => BottomNavBar()));
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message.toString())));
    }
  }

  getMobileFormWidget(context) {
    Size size = MediaQuery.of(context).size;

    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
        if (!isKeyboard)
          Text('Enter Your Phone Number',
              style: GoogleFonts.prompt(
                  fontWeight: FontWeight.w900, fontSize: 23)),
        SizedBox(
          height: size.height * 0.05,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Text(
              'We\'ll send an SMS with a code to verify your phone number',
              style: GoogleFonts.prompt(
                  fontWeight: FontWeight.w700, fontSize: 18)),
        ),
        SizedBox(
          height: size.height * 0.05,
        ),
        Container(
          width: size.width * 0.9,
          height: 70,
          decoration: BoxDecoration(
              color: Colors.greenAccent.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              maxLength: 9,
              decoration: InputDecoration(
                prefix: Text('+254'),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.1,
        ),
        ElevatedButton(
          onPressed: () async {
            //  if(checkfields())
            setState(() {
              showLoading = true;
            });

            await FirebaseAuth.instance.verifyPhoneNumber(
                phoneNumber: '+254${phoneController.text}',
                verificationCompleted: (phoneAuthCredential) async {
                  setState(() {
                    showLoading = false;
                  });
                  // signInWithPhoneAuthCredential(phoneAuthCredential);
                },
                verificationFailed: (verificationFailed) async {
                  setState(() {
                    showLoading = false;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(verificationFailed.message.toString())));
                },
                codeSent: (verificationId, resendingToken) async {
                  setState(() {
                    showLoading = false;
                    currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
                    this.verificationId = verificationId;
                  });
                },
                codeAutoRetrievalTimeout: (verificationId) async {});
          },
          child: Text(
            'send',
            style: TextStyle(fontFamily: 'Trueno'),
          ),
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              elevation: 8.0,
              shadowColor: Colors.greenAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              textStyle:
                  const TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
              primary: greenColor,
              onPrimary: Colors.white),
        ),
        Spacer()
      ],
    );
  }

  getOtpFormWidget(context) {
    Size size = MediaQuery.of(context).size;
    final FocusNode _pinPutFocusNode = FocusNode();
    final BoxDecoration pinPutDecoration = BoxDecoration(
      boxShadow: [
        BoxShadow(
            color: Colors.greenAccent.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3)
            //changes position of shadow
            )
      ],
      //initialized at runtime and can only be ran fi a single time
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: greenColor),
    );
    return Column(
      children: [
        Spacer(),
        Text(
          'Verify phone!',
          style: GoogleFonts.prompt(
            fontWeight: FontWeight.w700,
            fontSize: 25,
          ),
        ),
        SizedBox(
          height: size.height * 0.05,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Text('Code sent to +254${phoneController.text}',
              style: GoogleFonts.prompt(
                  fontWeight: FontWeight.w700, fontSize: 18)),
        ),
        SizedBox(
          height: size.height * 0.05,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: PinPut(
            fieldsCount: 6,
            controller: otpController,
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
          ),
        ),
        SizedBox(
          height: size.height * 0.1,
        ),
        ElevatedButton(
          onPressed: () async {
            PhoneAuthCredential phoneAuthCredential =
                PhoneAuthProvider.credential(
                    verificationId: verificationId,
                    smsCode: otpController.text);
            signInWithPhoneAuthCredential(phoneAuthCredential);
          },
          child: Text(
            'verify',
            style: TextStyle(fontFamily: 'Trueno'),
          ),
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              elevation: 8.0,
              shadowColor: Colors.greenAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              textStyle:
                  const TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
              primary: greenColor,
              onPrimary: Colors.white),
        ),
        Spacer()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(16),
      child: showLoading
          ? Center(
              child: Shimmer.fromColors(
                baseColor: Colors.greenAccent.withOpacity(0.3),
                highlightColor: Colors.greenAccent.withOpacity(0.1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.greenAccent.withOpacity(0.5),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Container(
                      width: size.width * 0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 70,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.greenAccent.withOpacity(0.5),
                            ),
                          ),
                          Container(
                            height: 70,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.greenAccent.withOpacity(0.5),
                            ),
                          ),
                          Container(
                            height: 70,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.greenAccent.withOpacity(0.5),
                            ),
                          ),
                          Container(
                            height: 70,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.greenAccent.withOpacity(0.5),
                            ),
                          ),
                          Container(
                            height: 70,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.greenAccent.withOpacity(0.5),
                            ),
                          ),
                          Container(
                            height: 70,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.greenAccent.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Container(
                      height: 70,
                      width: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.greenAccent.withOpacity(0.5),
                      ),
                    ),
                    Spacer()
                  ],
                ),
              ),
            )
          : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
              ? getMobileFormWidget(context)
              : getOtpFormWidget(context),
    ));
  }
}
