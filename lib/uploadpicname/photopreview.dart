import 'dart:io';

import 'dart:ui';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Mbisha extends StatefulWidget {
  final void Function(File _pickedImg) imagePickFunktion;
  Mbisha(this.imagePickFunktion);
  @override
  _MbishaState createState() => _MbishaState();
}

class _MbishaState extends State<Mbisha> {
  File _pickedImg;
  void _openGallery(BuildContext context) async {
    final picture = await ImagePicker()
        .getImage(source: ImageSource.gallery, imageQuality: 80, maxWidth: 150);
    final pickedImageFile = File(picture.path);
    setState(() {
      _pickedImg = pickedImageFile;
    });
    widget.imagePickFunktion(pickedImageFile);
    Navigator.of(context).pop();
  }

  void _openCamera(BuildContext context) async {
    final picture = await ImagePicker()
        .getImage(source: ImageSource.camera, imageQuality: 80, maxWidth: 150);
    final pickedImageFile = File(picture.path);
    setState(() {
      _pickedImg = pickedImageFile;
    });
    widget.imagePickFunktion(pickedImageFile);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    Color greenColor = const Color(0xFF00AF19);
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          backgroundImage: _pickedImg != null ? FileImage(_pickedImg) : null,

          //backgroundimage is of type imageprovider
          //fileimage loads the image
          //we wanna ensure that the picked user image is passed to the auth form then to auth screen
        ),
        Platform.isIOS
            ? CupertinoButton.filled(
                child: Icon(CupertinoIcons.photo_camera),
                onPressed: () {
                  _showSelectionDialog(context);
                },
              )
            : ElevatedButton.icon(
                onPressed: () {
                  _showSelectionDialog(context);
                },
                //pointer to function
                label: Text('Add Image'),
                icon: Icon(FontAwesomeIcons.cameraRetro),
                style: ButtonStyle(backgroundColor:
                          MaterialStateProperty.all(greenColor)),
              ),
      ],
    );
  }

  Future<void> _showSelectionDialog(BuildContext context) {
    Color greenColor = const Color(0xFF00AF19);
    return Platform.isIOS
        ? showCupertinoDialog(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                title: const Text(
                  'PICK IMAGE FROM :',
                  textAlign: TextAlign.center,
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [greenColor, Colors.greenAccent])),
                      child: Center(
                        child: GestureDetector(
                          child: Text("Gallery"),
                          onTap: () {
                            _openGallery(context);
                          },
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [greenColor, Colors.greenAccent])),
                      child: Center(
                        child: GestureDetector(
                          child: Text("Camera"),
                          onTap: () {
                            _openCamera(context);
                          },
                        ),
                      ),
                    )
                  ],
                ),
              );
            })
        : showDialog(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                title: const Text(
                  'PICK IMAGE FROM :',
                  textAlign: TextAlign.center,
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _openGallery(context);
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [greenColor, Colors.greenAccent])),
                        child: Center(
                          child: Text("Gallery"),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      onTap: () {
                        _openCamera(context);
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [greenColor, Colors.greenAccent])),
                        child: Center(
                          child: Text("Camera"),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            });
  }
}
