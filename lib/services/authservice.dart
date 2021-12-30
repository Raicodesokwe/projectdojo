import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projectdojo/services/navbar.dart';
import 'package:projectdojo/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:projectdojo/error_handler.dart';
import 'package:projectdojo/mucii/home_page.dart';
import 'dart:io';
import 'package:projectdojo/loginpage.dart';

class AuthService {
  //handles authservice
  //determines if user is authenticated
  handleAuth() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SplashScreen();
          }
          if (snapshot.hasData) {
            return BottomNavBar();
          } else
            return LoginPage();
        });
  }

  //signout logic
  signOut() {
    FirebaseAuth.instance.signOut();
  }

  signIn(String email, String password, context) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((val) => print('signed in'))
        .catchError((e) {
      ErrorHandler().errorDialog(context, e);
    });
    //then registers callbacks to be called when the future is completed
    //when the future completes with a value the onvalue callback shall be called with that value
  }

  resetPasswordLink(String email) {
    FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  

}
