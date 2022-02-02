import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectdojo/allaboard.dart/onboarding.dart';
import 'package:projectdojo/alpaca/trading.dart';
import 'package:projectdojo/bnpl/gridbox.dart';
import 'package:provider/provider.dart';
import 'splash_screen.dart';
import 'package:flutter/services.dart';

import 'package:projectdojo/theme.dart';
import 'package:projectdojo/services/authservice.dart';

void main() async {
  //this is the root widget
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  //we need to call firebase.initializeapp once in a future
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    //widgetsflutterbinding is used to interact with the flutter engine
    //firebase.initializeapp() needs to call native code to initialize firebase
    //the plugin uses platform channels to call the native code in an async manner thus we use ensureinitialized to ensure we have an instance of widgetsbinding
    //runapp calls the widgetsflutterbinding function internally
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    return FutureBuilder(
        future: _initialization,
        builder: (context, appSnapshot) {
          return MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (_) => ThemeProvider(),
                ),
                ChangeNotifierProvider(
                  create: (_) => Onboarder(),
                ),
                ChangeNotifierProvider(
                  create: (_) => GridBox(),
                ),
              
              ],
              child: Consumer<ThemeProvider>(
                  builder: (context, ThemeProvider notifier, child) {
                return MaterialApp(
                  theme: notifier.darkTheme
                      ? darkThemeData(context)
                      : lightThemeData(context),
                  // themeMode: ThemeMode.system,this is the default so no need to input it as an arg
                  debugShowCheckedModeBanner: false,
                  home: appSnapshot.connectionState != ConnectionState.done
                      ? SplashScreen()
                      : AuthService().handleAuth(),
                  // routes: {
                  //   '/loginpage':(ctx)=>LoginPage()
                  // },
                  //populates the homepage based on the auth state of the user
                  //we need to login the user that's already logged in
                  //upon logging out user should be taken to login page
                  //login shall be in a form manner
                  // routes: {
                  //   MailScreen.routeName:(ctx)=>MailScreen(),
                  // },
                );
              }));
        });
  }
}
