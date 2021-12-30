import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectdojo/savings/savingsimage.dart';
import 'package:projectdojo/savings/setsavingsdate.dart';
import 'package:provider/provider.dart';

import '../theme.dart';

class PersonalSavingsHome extends StatelessWidget {
  final _turo = GlobalKey<FormState>();
  checkFields() {
    final form = _turo.currentState;
    if (form.validate()) {
      // FocusScope.of(context).unfocus();
      form.save();
      return true;
    }
    return false;
  }

  String validateVaultName(String value) {
    if (value.length < 4) {
      return 'Please enter at least four characters';
    }
    return null;
  }

  File imgFile;
  String vaultName;
  void _savedimg(File img) {
    imgFile = img;
  }

  final TextEditingController _chipController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final isKeyBoard = MediaQuery.of(context).viewInsets.bottom != 0;
    Size size = MediaQuery.of(context).size;
    final TextStyle cardTextStyle =
        GoogleFonts.spartan(color: Colors.white, fontWeight: FontWeight.w600);
    final themeColor = Provider.of<ThemeProvider>(context).darkTheme;
    Color greenColor = const Color(0xFF00AF19);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              if (!isKeyBoard) SavingsImage(_savedimg),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: size.width * 0.8,
                decoration: BoxDecoration(
                    color: Colors.greenAccent.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(29)),
                child: Form(
                  key: _turo,
                  child: TextFormField(
                    controller: _chipController,
                    onChanged: (value) {
                      this.vaultName = value;
                    },
                    validator: (value) => value.isEmpty
                        ? 'Please enter a vault name'
                        : validateVaultName(value),
                    maxLength: 25,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        icon: Icon(
                          FontAwesomeIcons.pen,
                          color: Colors.greenAccent,
                        ),
                        hintText: "Name your vault",
                        border: InputBorder.none),
                  ),
                ),
              ),
              if (!isKeyBoard)
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: Row(
                      children: [
                        ActionChip(
                          label: Text(
                            'Vacation',
                            style: cardTextStyle.copyWith(
                                fontSize: 13,
                                fontWeight: FontWeight.w200,
                                color: Colors.black),
                          ),
                          backgroundColor: Colors.greenAccent,
                          onPressed: () {
                            _chipController.text = 'Vacation';
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ActionChip(
                          label: Text(
                            'Vacation',
                            style: cardTextStyle.copyWith(
                                fontSize: 13,
                                fontWeight: FontWeight.w200,
                                color: Colors.black),
                          ),
                          backgroundColor: Colors.greenAccent,
                          onPressed: () {
                            _chipController.text = 'Vacation';
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ActionChip(
                          label: Text(
                            'Vacation',
                            style: cardTextStyle.copyWith(
                                fontSize: 13,
                                fontWeight: FontWeight.w200,
                                color: Colors.black),
                          ),
                          backgroundColor: Colors.greenAccent,
                          onPressed: () {
                            _chipController.text = 'Vacation';
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ActionChip(
                          label: Text(
                            'Vacation',
                            style: cardTextStyle.copyWith(
                                fontSize: 13,
                                fontWeight: FontWeight.w200,
                                color: Colors.black),
                          ),
                          backgroundColor: Colors.greenAccent,
                          onPressed: () {
                            _chipController.text = 'Vacation';
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              SizedBox(
                height: size.height * 0.2,
              ),
              GestureDetector(
                onTap: () {
                  if (checkFields())
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SetSavingsDate()));
                },
                child: Container(
                  height: 50.0,
                  width: size.width * 0.85,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
