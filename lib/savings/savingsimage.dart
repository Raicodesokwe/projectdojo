import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class SavingsImage extends StatefulWidget {
  final void Function(File _savedImg) savingImageFunction;

  const SavingsImage(this.savingImageFunction);

  @override
  _SavingsImageState createState() => _SavingsImageState();
}

class _SavingsImageState extends State<SavingsImage> {
  File _savedImg;
  void _openGallery(BuildContext context) async {
    final picture = await ImagePicker().getImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    final pickedImageFile = File(picture.path);
    setState(() {
      _savedImg = pickedImageFile;
    });
    widget.savingImageFunction(pickedImageFile);
    Navigator.of(context).pop();
  }

  void _openCamera(BuildContext context) async {
    final picture = await ImagePicker().getImage(
      source: ImageSource.camera,
      imageQuality: 80,
    );
    final pickedImageFile = File(picture.path);
    setState(() {
      _savedImg = pickedImageFile;
    });
    widget.savingImageFunction(pickedImageFile);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(children: [
      Container(
        child: _savedImg != null
            ? Container(
                height: size.height * 0.3,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: FileImage(_savedImg), fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
              )
            : Container(
                height: size.height * 0.3,
                width: double.infinity,
                decoration: BoxDecoration(
                    // image: DecorationImage(image: AssetImage("assets/revolutvault.png",),fit: BoxFit.cover),
                    color: Colors.greenAccent.withOpacity(0.5),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    child: Image.asset(
                      "assets/revolutvault.png",
                      fit: BoxFit.cover,
                    )),
              ),
      ),
      Positioned(
        top: 0,
        left: 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                FontAwesomeIcons.arrowLeft,
                color: Colors.black,
                // color: Theme.of(context).iconTheme,
              ),
            ),
          ),
        ),
      ),
      Positioned(
        top: 10,
        left: 100,
        child: Text(
          'Customize',
          style: TextStyle(
              fontFamily: 'Trueno', fontSize: 23, fontWeight: FontWeight.bold),
        ),
      ),
      Positioned(
          bottom: 15,
          right: 15,
          child: Platform.isIOS
              ? CupertinoButton.filled(
                  child: Icon(CupertinoIcons.photo_camera),
                  onPressed: () {
                    _showSelectionDialog(context);
                  },
                )
              : ElevatedButton.icon(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
                      elevation: MaterialStateProperty.all(5),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.greenAccent)),
                  onPressed: () {
                    _showSelectionDialog(context);
                  },
                  icon: Icon(
                    FontAwesomeIcons.cameraRetro,
                    color: Colors.black,
                  ),
                  label: Text(''))),
    ]);
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
