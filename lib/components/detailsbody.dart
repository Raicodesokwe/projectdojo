import 'dart:io';

import 'package:projectdojo/services/authservice.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lottie/lottie.dart';
import 'package:projectdojo/components/Backgroundlogin.dart';
import 'package:projectdojo/places.dart';
import 'package:projectdojo/signup_phonenumber.dart';
import 'package:projectdojo/theme.dart';
import 'package:projectdojo/components/Backgrounddetails.dart';
import 'package:projectdojo/error_handler.dart';
import 'package:intl/intl.dart';

class BodyDetails extends StatefulWidget {
  final String email;
  final String password;
  final String id;
  final String currentSelectedVal;
  final File imgFile;
  final String name;
  BodyDetails(this.email, this.password, this.id, this.currentSelectedVal,
      this.imgFile, this.name);

  @override
  _BodyDetailsState createState() => _BodyDetailsState();
}

class _BodyDetailsState extends State<BodyDetails> {
  final _mokwasi = GlobalKey<FormState>();

  File imgFile;
  String email, password, firstname, secondname, id, currentSelectedVal, name;

  checkFields() {
    final form = _mokwasi.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  DateTime selectedDate = DateTime.now();
  DateTime date;
  Future<void> _selectDate(BuildContext context) async {
    Color greenColor = const Color(0xFF00AF19);
    final DateTime picked = await showDatePicker(
        builder: (BuildContext context, Widget child) {
          return Theme(
              data: ThemeData.light().copyWith(
                primaryColor: greenColor,
                accentColor: Colors.green[300],
                colorScheme: ColorScheme.light(primary: Colors.greenAccent),
                buttonTheme:
                    ButtonThemeData(textTheme: ButtonTextTheme.primary),
              ),
              child: child);
        },
        context: context,
        initialDate: DateTime(2003),
        firstDate: DateTime(1940),
        lastDate: DateTime.now().subtract(Duration(days: 6400))
        );
    if (picked != null && picked != date) {
      print('hello $picked');
      setState(() {
        date = picked;
      });
    }
  }

  final TextEditingController _firstnameController =
      new TextEditingController();
  final TextEditingController _segundanameController =
      new TextEditingController();
  final TextEditingController _dobController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    Color greenColor = const Color(0xFF00AF19);
    Size size = MediaQuery.of(context).size;
    // Registration register=new Registration(null, null, dob, firstname, null, null, null, null, null, secondname);
    //provides total height and width of our screen
    // register.firstname=firstname;
    // register.secondname=secondname;
    // register.dob=dob;
    return BackgroundDetails(
        child: Form(
      key: _mokwasi,
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
              Lottie.asset("assets/id.json", height: size.height * 0.2),
              Container(
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  controller: _firstnameController,
                  validator: (value) =>
                      value.isEmpty ? 'First name is required' : null,
                  decoration: InputDecoration(
                      labelText: 'FIRST LEGAL NAME',
                      labelStyle: TextStyle(
                          fontFamily: 'Trueno',
                          fontSize: 12.0,
                          color: Colors.grey.withOpacity(0.5)),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: greenColor),
                      )),
                  onChanged: (value) {
                    this.firstname = value;

                    //this keyword reps an implicit object pointing to current class object
                    //eliminates confusion between class attributes and parameters with same name
                  },
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                controller: _segundanameController,
                validator: (value) =>
                    value.isEmpty ? 'Second name is required' : null,
                decoration: InputDecoration(
                    labelText: 'SECOND LEGAL NAME',
                    labelStyle: TextStyle(
                        fontFamily: 'Trueno',
                        fontSize: 12.0,
                        color: Colors.grey.withOpacity(0.5)),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: greenColor),
                    )),
                onChanged: (value) {
                  this.secondname = value;

                  //this keyword reps an implicit object pointing to current class object
                  //eliminates confusion between class attributes and parameters with same name
                },
              ),
              TextFormField(
                validator: (value) =>
                    value.isEmpty ? 'Date of birth is required' : null,
                maxLength: 10,
                controller: _dobController,
                onTap: () async {
                  // Below line stops keyboard from appearing
                  FocusScope.of(context).requestFocus(new FocusNode());
                  // Show Date Picker Here
                  await _selectDate(context);
                  _dobController.text = DateFormat('yyyy/MM/dd').format(date);
                  //setState(() {});
                },
                decoration: InputDecoration(
                    labelText: 'DATE OF BIRTH',
                    labelStyle: TextStyle(
                        fontFamily: 'Trueno',
                        fontSize: 12.0,
                        color: Colors.grey.withOpacity(0.5)),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: greenColor),
                    )),
                onChanged: (value) {
                  _dobController.text = value;

                  //this keyword reps an implicit object pointing to current class object
                  //eliminates confusion between class attributes and parameters with same name
                },
              ),
              SizedBox(
                height: 35.0,
              ),
              GestureDetector(
                onTap: () {
                  if (checkFields())
                    // AuthService()
                    //     .signUp(
                    //   email,
                    //   // imgFile,
                    //   // //removes excess whitespace at the beginning or end
                    //   password,
                    //   // id,
                    //   // currentSelectedVal,
                    //   // name,
                    //   // firstname.trim(),
                    //   // secondname.trim(),
                    //   // dob,
                    //   // phonenumber
                    // )
                    //     .then((authResult) {
                    //   FirebaseFirestore.instance
                    //       .collection('users')
                    //       .doc(authResult.user.uid)
                    //       .set({
                    //     'firstname': firstname,
                    //     'secondname': secondname,
                    //     'dob': dob,
                    //   }

                    // }).then((res) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PhoneNumberSignup(
                            widget.email,
                            widget.password,
                            widget.id,
                            widget.currentSelectedVal,
                            widget.imgFile,
                            widget.name,
                            firstname,
                            secondname,
                            _dobController.text)));

                  //   }).catchError((e) {
                  //     ErrorHandler().errorDialog(context, e);
                  //   });
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
