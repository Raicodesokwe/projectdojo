
import 'package:projectdojo/details.dart';

import 'package:projectdojo/uploadpicname/photopreview.dart';

import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

import 'package:projectdojo/uploadpicname/BackgroundRitwa.dart';

import 'dart:io';

class BodyRitwa extends StatefulWidget {
  // final Registration register;
  // BodyRitwa({Key key, @required this.register}) : super(key: key);
  final String email;
final String password;
final String id;
final String currentSelectedVal;
BodyRitwa(this.email,this.password,this.id,this.currentSelectedVal);
  @override
  _BodyRitwaState createState() => _BodyRitwaState();
}

class _BodyRitwaState extends State<BodyRitwa> {
  final _dari = GlobalKey<FormState>();

  String validateUsername(String value) {
    if (value.length < 4) {
      return 'Please enter at least four characters';
    }
    return null;
  }

  checkFields() {
    final form = _dari.currentState;
    if (form.validate()) {
      FocusScope.of(context).unfocus();
      if (imgFile == null) {
        //if user aint picked an img
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Please enter a valid image!!!'),
          backgroundColor: Colors.red,
        ));

        return;
        //this avoids the next part being executed
      }
      form.save();
      return true;
    }
    return false;
  }

  File imgFile;
  // String email,
  //     password,
  //     id,
  //     currentSelectedVal,
      // confirmpassword,
      // id,
      // currentSelectedVal,
     String name;
  // firstname,
  // secondname,
  // dob,
  // phonenumber
void _pickedImg(File img) {
      imgFile = img;
    }
  @override
  Widget build(BuildContext context) {
    // Registration register = new Registration(
    //     null, null, null, null, null, imgFile, name, null, null, null);
    // register.imgFile=imgFile;

    // register.name = name;
    Color greenColor = const Color(0xFF00AF19);
  
    //provides total height and width of our screen
    return BackgroundRitwa(
      child: Form(
        key: _dari,
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
              SizedBox(
                height: 35.0,
              ),
              Mbisha(_pickedImg),
              SizedBox(
                height: 35.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Lottie.asset(
                      "assets/mbesha.json",
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      validator: (value) => value.isEmpty
                          ? 'Please enter username'
                          : validateUsername(value),
                      decoration: InputDecoration(
                          labelText: 'PREFERRED USERNAME',
                          prefix: Padding(
                            padding: EdgeInsets.all(4),
                            child: Text('\$'),
                          ),
                          labelStyle: TextStyle(
                              fontFamily: 'Trueno',
                              fontSize: 12.0,
                              color: Colors.grey.withOpacity(0.5)),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: greenColor),
                          )),
                      onChanged: (value) {
                        this.name = value;

                        //this keyword reps an implicit object pointing to current class object
                        //eliminates confusion between class attributes and parameters with same name
                      },
                    ),
                  ),
                ],
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
                    //   //removes excess whitespace at the beginning or end
                    //   password,
                    //   // id,
                    //   // currentSelectedVal,
                    //   // name.trim(),
                    //   // firstname,
                    //   // secondname,
                    //   // dob,
                    //   // phonenumber
                    // )
                    //     .then((authResult) {
                    //   final ref = FirebaseStorage.instance
                    //       .ref()
                    //       .child('user_images')
                    //       .child(authResult.user.uid + '.jpg');
                    //   //   this returns a storage reference that is a pointer to a certain path
                    //   ref.putFile(imgFile);
                    //   //   //we wanna get a link to this image to use it throughout the app by storing it in firestore
                    //   final url = ref.getDownloadURL();
                    //   FirebaseFirestore.instance
                    //       .collection('users')
                    //       .doc(authResult.user.uid)
                    //       .set({
                    //     'image_url': url,
                    //     'name': name,
                    //   });

                    // }).then((res) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DeetsScreen(
                          widget.email,
                          widget.password,
                          widget.id,
                          widget.currentSelectedVal,
                          imgFile,
                          name
                              // register: register,
                            )));
                  
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
