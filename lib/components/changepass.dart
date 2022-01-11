import 'package:lottie/lottie.dart';

import 'package:flutter/cupertino.dart';
import 'package:projectdojo/components/Backgroundchangepass.dart';



import 'package:flutter/material.dart';


import 'package:projectdojo/services/authservice.dart';

class BodyPassChange extends StatefulWidget {
  // final Registration register;
  // BodyPassChange({Key key, @required this.register}) : super(key: key);
  @override
  _BodyPassChangeState createState() => _BodyPassChangeState();
}

class _BodyPassChangeState extends State<BodyPassChange> {
  final _dokoro = new GlobalKey<FormState>();
  // var registeredProdo = Registration(
  //     currentSelectedVal: null,
  //     id: null,
  //     imgFile: null,
  //     dob: null,
  //     email: null,
  //     firstname: null,
  //     name: null,
  //     password: null,
  //     phonenumber: null,
  //     secondname: null);
  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  String validatePassword(String value) {
    if (value.length != 6) {
      return 'Password must only be six digits long';
    }
    return null;
  }

  checkFields() {
    final form = _dokoro.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  String email = '';

  @override
  Widget build(BuildContext context) {
    // Registration register = new Registration(
    //     email, null, null, null, null, null, null, password, null, null);

    TextEditingController _emailController = new TextEditingController();
    // email = register.email;

    // password = register.password;
    Color greenColor = const Color(0xFF00AF19);
    //provides total height and width of our screen
    Size size = MediaQuery.of(context).size;
    return BackgroundChangePass(
        child: Form(
      key: _dokoro,
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
              Lottie.asset("assets/pasiwadi.json", height: size.height * 0.4),
              Container(
                child: TextFormField(
                  controller: _emailController,
                  validator: (value) => value.isEmpty
                      ? 'Email is required'
                      : validateEmail(value),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'EMAIL',
                      labelStyle: TextStyle(
                          fontFamily: 'Trueno',
                          fontSize: 12.0,
                          color: Colors.grey.withOpacity(0.5)),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: greenColor),
                      )),
                  onChanged: (value) {
                    this.email = value;
                    //builder rebuilds that specific part of the widget tree
                    // registeredProdo = Registration(
                    //     email: value,
                    //     secondname: registeredProdo.secondname,
                    //     phonenumber: registeredProdo.phonenumber,
                    //     password: registeredProdo.password,
                    //     name: registeredProdo.name,
                    //     firstname: registeredProdo.firstname,
                    //     dob: registeredProdo.dob,
                    //     imgFile: registeredProdo.imgFile,
                    //     id: registeredProdo.id,
                    //     currentSelectedVal: registeredProdo.currentSelectedVal);

                    //this keyword reps an implicit object pointing to current class object
                    //eliminates confusion between class attributes and parameters with same name
                  },
                ),
              ),
              SizedBox(
                height: 35.0,
              ),
              GestureDetector(
                onTap: () {
                  if (checkFields())
                    // print('email is ${register.email}');
                    AuthService().resetPasswordLink(email);
                  Navigator.of(context).pop();

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
                      child: const Text(
                        'RESET',
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
