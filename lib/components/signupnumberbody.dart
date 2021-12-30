import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shimmer/shimmer.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:projectdojo/otp.dart';
import 'package:projectdojo/components/Background.dart';
import 'package:lottie/lottie.dart';
import 'package:projectdojo/services/authservice.dart';
import 'package:projectdojo/error_handler.dart';
import 'dart:io';

class BodyNumber extends StatefulWidget {
  final String email;
  final String password;
  final String id;
  final String currentSelectedVal;
  final File imgFile;
  final String name;
  final String firstname;
  final String secondname;
  final String dob;
  BodyNumber(this.email, this.password, this.id, this.currentSelectedVal,
      this.imgFile, this.name, this.firstname, this.secondname, this.dob);

  @override
  _BodyNumberState createState() => _BodyNumberState();
}

class _BodyNumberState extends State<BodyNumber> {
  checkFields() {
    final form = _kweche.currentState;
    if (form.validate()) {
      FocusScope.of(context).unfocus();
      form.save();
      return true;
    }
    return false;
  }

  bool isLoading = false;
  String validatePhoneNumber(String value) {
    if (value.length != 10) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  final _kweche = GlobalKey<FormState>();
  User user;
  String email,
      password,
      phonenumber,
      id,
      currentSelectedVal,
      name,
      firstname,
      secondname,
      dob;

  final TextEditingController _phoneNumberController =
      new TextEditingController();
  @override
  Widget build(BuildContext context) {
    // Registration register=new Registration(null, null, null, null, null, null, null, null, phonenumber, null);
    // register.phonenumber=phonenumber;
    Size size = MediaQuery.of(context).size;
    Color greenColor = const Color(0xFF00AF19);
    //provides total height and width of our screen
    return Background(
      child: Form(
        key: _kweche,
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
              Lottie.asset("assets/contact.json", height: size.height * 0.3),
              Row(
                children: [
                  Expanded(
                      //expanded widget helps us fill rows and columns

                      child: CountryCodePicker(
                    initialSelection: 'KE',
                    enabled: false,
                    hideMainText: true,
                    //only flag shown
                  )),
                  Expanded(
                    flex: 3,
                    //controls the size ofthe children of the row in expanded widgets to cover the whole row
                    child: TextFormField(
                      controller: _phoneNumberController,
                      validator: (value) => value.isEmpty
                          ? 'Phone number is required'
                          : validatePhoneNumber(value),
                      decoration: InputDecoration(
                          labelText: 'Phone Number',
                          prefix: Padding(
                            padding: EdgeInsets.all(4),
                            child: Text('+254'),
                          ),
                          labelStyle: TextStyle(
                              fontFamily: 'Trueno',
                              fontSize: 12.0,
                              color: Colors.grey.withOpacity(0.5)),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: greenColor),
                          )),
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      //controller handles changes to a textfield
                      //u can use onchanged or controller
                      //controller is a more elaborate way to handle changes to a textfield
                      //we call dispose to clea off controller from widget field
                      onChanged: (value) {
                        this.phonenumber = value;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 45.0,
              ),
              GestureDetector(
                onTap: () async {
                  if (checkFields()) {
                    setState(() {
                      isLoading = true;
                    });
                    UserCredential authResult;

                    authResult = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: widget.email, password: widget.password)
                        .catchError((e) {
                      ErrorHandler().errorDialog(context, e);
                    });

                    final ref = FirebaseStorage.instance
                        .ref()
                        .child('user_images')
                        .child(authResult.user.uid + '.jpg');
                    await ref.putFile(widget.imgFile).catchError((e) {
                      ErrorHandler().errorDialog(context, e);
                    });
                    final url = await ref.getDownloadURL().catchError((e) {
                      ErrorHandler().errorDialog(context, e);
                    });

                    await FirebaseFirestore.instance
                        .collection('users')
                        .doc(authResult.user.uid)
                        .set({
                      //     //set stores extra user data in a map
                      'email': widget.email,
                      'image_url': url,
                      'id': widget.id,
                      'currentSelectedVal': widget.currentSelectedVal,
                      'name': '\$' + widget.name,
                      'firstname': widget.firstname,
                      'secondname': widget.secondname,
                      'dob': widget.dob,
                      'phonenumber': _phoneNumberController.text,
                    }).catchError((e) {
                      ErrorHandler().errorDialog(context, e);
                      setState(() {
                        isLoading = false;
                      });
                    });
                    setState(() {
                      isLoading = false;
                    });
                    // Navigator.of(context).push(
                    //     MaterialPageRoute(builder: (context) => HomePage()));

                    // AuthService()
                    //     .signUp(email, imgFile, password, id, currentSelectedVal,
                    //         name, firstname, secondname, dob, phonenumber)
                    //     .catchError((e) {
                    //   ErrorHandler().errorDialog(context, e);
                    // });
                    // AuthService()
                    //     .signUp(
                    //   email,

                    //   //removes excess whitespace at the beginning or end
                    //   password,
                    //   // id,
                    //   // currentSelectedVal,
                    //   // name,
                    //   // firstname,
                    //   // secondname,
                    //   // dob,
                    //   // phonenumber.trim()
                    // )
                    //     .then((authResult) {
                    //   FirebaseFirestore.instance
                    //       .collection('users')
                    //       .doc(authResult.user.uid)
                    //       .set({'phonenumber': phonenumber});
                    // }).then((res) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => OtpScreen(
                            _phoneNumberController.text, authResult.user)));
                  }

                  // }).catchError((e) {
                  //   ErrorHandler().errorDialog(context, e);
                  // });
                },
                child: Container(
                  height: 50.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.greenAccent,
                    color: greenColor,
                    elevation: 7.0,
                    child: Center(
                      child: isLoading
                          ? Shimmer.fromColors(
                              baseColor: Colors.green[300],
                              highlightColor: Colors.green[100],
                              child: Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.green[300],
                                ),
                              ),
                            )
                          : const Text(
                              'NEXT',
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'Trueno'),
                            ),
                    ),
                  ),
                  //materialapp widget is a wrapper of other flutter widgets
                  //material widget clips to a shape
                  //it elevates its widget subtree along z axis
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
