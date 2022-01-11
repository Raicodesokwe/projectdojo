
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

import 'package:projectdojo/jengajina.dart';

import 'package:projectdojo/components/Backgroundplace.dart';


class BodyPlaces extends StatefulWidget {
  // final Registration register;
  // BodyPlaces({
  //   Key key,
  //   @required this.register,
  // }) : super(key: key);
  final String email;
  final String password;
  BodyPlaces(this.email, this.password);
  @override
  _BodyPlacesState createState() => _BodyPlacesState();
}

class _BodyPlacesState extends State<BodyPlaces> {
  final formKey = GlobalKey<FormState>();

  // var regimen = Registration(
  //     email: null,
  //     currentSelectedVal: null,
  //     id: null,
  //     imgFile: null,
  //     dob: null,
  //     firstname: null,
  //     name: null,
  //     password: null,
  //     phonenumber: null,
  //     secondname: null);
  // String email;
  // String password;
  String currentSelectedVal;
  String id = '';
  checkFields() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  String validateId(String value) {
    if (value.length > 8 || value.length < 7) {
      return 'Please enter a valid ID number';
    }
    return null;
  }

  TextEditingController _idController = new TextEditingController();
  var _counties = [
    
    "Mombasa",
    "Kwale",
    "Kilifi",
    "Tana River",
    "Lamu",
    "Taita-Taveta",
    "Garissa",
    "Wajir",
    "Mandera",
    "Marsabit",
    "Isiolo",
    "Meru",
    "Tharaka-Nithi",
    "Embu",
    "Kitui",
    "Machakos",
    "Makueni",
    "Nyandarua",
    "Nyeri",
    "Kirinyaga",
    "Murang'a",
    "Kiambu",
    "Turkana",
    "West Pokot",
    "Samburu",
    "Trans-Nzoia",
    "Uasin Gishu",
    "Elgeyo-Marakwet",
    "Nandi",
    "Baringo",
    "Laikipia",
    "Nakuru",
    "Narok",
    "Kajiado",
    "Kericho",
    "Bomet",
    "Kakamega",
    "Vihiga",
    "Bungoma",
    "Busia",
    "Siaya",
    "Kisumu",
    "Homa Bay",
    "Migori",
    "Kisii",
    "Nyamira",
    "Nairobi",
  ];

  @override
  Widget build(BuildContext context) {
    Color greenColor = const Color(0xFF00AF19);
    Size size = MediaQuery.of(context).size;
    // Registration register = new Registration(null, currentSelectedVal,
    //     null, null, id, null, null, null, null, null);
    // // register.email = email;
    // // register.password = password;
    // register.id = id;
    // register.currentSelectedVal = currentSelectedVal;
    //provides total height and width of our screen
    return BackgroundPlaces(
        child: Form(
      key: formKey,
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
              Lottie.asset("assets/utambuzi.json", height: size.height * 0.3),
              Container(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _idController,
                  validator: (value) => value.isEmpty
                      ? 'Please enter ID number'
                      : validateId(value),
                  decoration: InputDecoration(
                      labelText: 'ID number',
                      labelStyle: TextStyle(
                          fontFamily: 'Trueno',
                          fontSize: 12.0,
                          color: Colors.grey.withOpacity(0.5)),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: greenColor),
                      )),
                  onChanged: (value) {
                    this.id = value;
                    // regimen = Registration(
                    //     email: regimen.email,
                    //     secondname: regimen.secondname,
                    //     phonenumber: regimen.phonenumber,
                    //     password: regimen.password,
                    //     name: regimen.name,
                    //     firstname: regimen.firstname,
                    //     dob: regimen.dob,
                    //     imgFile: regimen.imgFile,
                    //     id: value,
                    //     currentSelectedVal: regimen.currentSelectedVal);
                    //this keyword reps an implicit object pointing to current class object
                    //eliminates confusion between class attributes and parameters with same name
                  },
                ),
              ),
              Container(
                child: FormField<String>(
                  validator: (value) =>
                      value.isEmpty ? 'County is required' : null,
                  builder: (
                    FormFieldState<String> state,
                  ) {
                    return InputDecorator(
                      decoration: InputDecoration(
                          labelText: 'COUNTY',
                          labelStyle: TextStyle(
                              fontFamily: 'Trueno',
                              fontSize: 12.0,
                              color: Colors.grey.withOpacity(0.5)),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: greenColor),
                          )),
                      isEmpty: currentSelectedVal == '',
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          
                          style: TextStyle(color: Colors.black),
                          dropdownColor: Colors.greenAccent,
                            value: currentSelectedVal,
                            isDense: true,
                            onChanged: (value) {
                              setState(() {
                                this.currentSelectedVal = value;
                                // regimen = Registration(
                                //     email: regimen.email,
                                //     secondname: regimen.secondname,
                                //     phonenumber: regimen.phonenumber,
                                //     password: regimen.password,
                                //     name: regimen.name,
                                //     firstname: regimen.firstname,
                                //     dob: regimen.dob,
                                //     imgFile: regimen.imgFile,
                                //     id: regimen.id,
                                //     currentSelectedVal: value);

                                state.didChange(value);
                                //updates the field's state to a new value
                              });
                              //this keyword reps an implicit object pointing to current class object
                              //eliminates confusion between class attributes and parameters with same name
                            },
                            items: _counties.map((e) {
                              return DropdownMenuItem(
                                  value: e, child: Text(e));
                            }).toList()),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 35.0,
              ),
              GestureDetector(
                onTap: () {
                  if (checkFields())
                    //   AuthService()
                    //       .signUp(
                    //     email,
                    //     // imgFile,
                    //     // //removes excess whitespace at the beginning or end
                    //     password,
                    //     // id.trim(),
                    //     // currentSelectedVal.trim(),
                    //     // name,
                    //     // firstname,
                    //     // secondname,
                    //     // dob,
                    //     // phonenumber
                    //   )
                    //       .then((authResult) {
                    //     FirebaseFirestore.instance
                    //         .collection('users')
                    //         .doc(authResult.user.uid)
                    //         .set({
                    //       'id': id,
                    //       'currentSelectedVal': currentSelectedVal,
                    //     });
                    //   }).then((res) {

                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => RitwaScreen(
                            widget.email,
                            widget.password,
                            _idController.text,
                            currentSelectedVal
                            // email: this.email,
                            // password: this.password,
                            // id: this.id,
                            // currentSelectedVal: this.currentSelectedVal,
                            )));

                  //   }).catchError((e) {
                  //     ErrorHandler().errorDialog(context, e);
                  //   });
                  // }
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
