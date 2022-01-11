
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projectdojo/mucii/home_page.dart';
import 'package:projectdojo/services/navbar.dart';
import 'package:projectdojo/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:projectdojo/error_handler.dart';

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
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
          Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => BottomNavBar()));
    } on FirebaseAuthException catch (e) {
       ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message.toString())));
    }
        
    //then registers callbacks to be called when the future is completed
    //when the future completes with a value the onvalue callback shall be called with that value
  }

  resetPasswordLink(String email) {
    FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  

}
