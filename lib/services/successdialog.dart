import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//this Success handler shall display all our Successs neatly for us
class SuccessHandler {
  Color greenColor = const Color(0xFF00AF19);
  Future<bool> successDialog(BuildContext context, e) {
    return Platform.isIOS
        ? showCupertinoDialog(
            context: context,
            barrierDismissible: true,
            builder: (context) {
              return Container(
                decoration: BoxDecoration(gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              greenColor,
              Colors.lightGreen,
              Colors.green[300],
              Colors.green[100],
            ],
                stops: [
              0.2,
              0.4,
              0.6,
              0.75
            ])),
                child: AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  title: const Text('Success',style: TextStyle(color: Colors.white)),
                  content: Column(
                    children: [
                       Center(
                          child: Text(e.toString(),style: TextStyle(color: Colors.white)),
                        ),
                     
                      Container(
                        height: 50.0,
                        child: Row(
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Ok',style: TextStyle(color: Colors.white)))
                          ],
                        ),
                      )
                    ],
                    mainAxisSize: MainAxisSize.min,
                  ),
                  //minimum space leftover after children have occupied the space
                ),
              );
            })
        : showDialog(
            context: context,
            barrierDismissible: true,
            builder: (context) {
              return Container(
                decoration: BoxDecoration(gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              greenColor,
              Colors.lightGreen,
              Colors.green[300],
              Colors.green[100],
            ],
                stops: [
              0.2,
              0.4,
              0.6,
              0.75
            ])),
                child: AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  title: const Text('Success',style: TextStyle(color: Colors.white)),
                  content: Column(
                    children: [
                       Center(
                          child: Text(e.toString(),style: TextStyle(color: Colors.white),),
                        ),
                     
                      Container(
                        height: 50.0,
                        child: Row(
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Ok',style: TextStyle(color: Colors.white)))
                          ],
                        ),
                      )
                    ],
                    mainAxisSize: MainAxisSize.min,
                  ),
                  //minimum space leftover after children have occupied the space
                ),
              );
            });
    //displays ios style dialog above contents of the app
    //it takes a builder that builds a cupertinoalertdialog widget
    //the content below the dialog is dimmed
    //we use stateful if dialog needs to update dynamically
  }
  //buildcontext handles location of a widget in a widget tree
}
