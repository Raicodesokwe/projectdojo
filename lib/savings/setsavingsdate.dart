import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class SetSavingsDate extends StatefulWidget {
  @override
  _SetSavingsDateState createState() => _SetSavingsDateState();
}

class _SetSavingsDateState extends State<SetSavingsDate> {
  final _dateSaving = GlobalKey<FormState>();

  checkFields() {
    final form = _dateSaving.currentState;
    if (form.validate()) {
      // FocusScope.of(context).unfocus();
      form.save();
      return true;
    }
    return false;
  }

  var _selecta;
  final TextEditingController _setDateController = new TextEditingController();
  final TextEditingController _setMoneyController = new TextEditingController();
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
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 20000)));
    if (picked != null && picked != date) {
      print('hello $picked');
      setState(() {
        date = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Color greenColor = const Color(0xFF00AF19);
    final TextStyle cardNumberStyle =
        GoogleFonts.openSans(fontSize: 18, fontWeight: FontWeight.w600);
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // automaticallyImplyLeading: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  //  boxShadow: [
                  //       BoxShadow(
                  //           blurRadius: 2,
                  //           spreadRadius: 2,
                  //           color: Colors.black87.withOpacity(0.2))
                  //     ],
                  color: Colors.greenAccent.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10.0)),
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
        body: Form(
          key: _dateSaving,
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              children: [
                Center(
                  child: Text('Your goal',
                      style: TextStyle(
                          fontFamily: 'Trueno',
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Theme.of(context).textTheme.headline6.color)),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Container(
                  height: 50,
                  width: size.width * 0.85,
                  decoration: BoxDecoration(
                      color: Colors.greenAccent.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(29.0)),
                  padding: const EdgeInsets.only(left: 16, right: 8),
                  child: DropdownButtonFormField(
                    // value: _selecta,
                     hint: Container(width: 250,child: Text("Select currency,crypto or commodity",overflow: TextOverflow.ellipsis,)),
                    decoration: InputDecoration(border: InputBorder.none),
                    icon: Icon(
                      FontAwesomeIcons.angleDown,
                    ),
                    onChanged: (onitem) {
                      if (onitem == 'zari') {
                        _setMoneyController.text='Zar';
                      }
                    },
                    items: [
                      DropdownMenuItem(
                        value: 'zari',
                        child: Container(
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(100)),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Text('South African Rand'),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Text('ZAR')
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 50,
                  width: size.width * 0.85,
                  decoration: BoxDecoration(
                      color: Colors.greenAccent.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(29)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 8.0),
                    child: TextFormField(
                      onChanged: (value) {
                        _setDateController.text = value;

                        //this keyword reps an implicit object pointing to current class object
                        //eliminates confusion between class attributes and parameters with same name
                      },
                      onTap: () async {
                        // Below line stops keyboard from appearing
                        FocusScope.of(context).requestFocus(new FocusNode());
                        // Show Date Picker Here
                        await _selectDate(context);
                        _setDateController.text =
                            DateFormat('yyyy/MM/dd').format(date);
                        //setState(() {});
                      },
                      // maxLength: 10,
                      controller: _setDateController,
                      validator: (value) =>
                          value.isEmpty ? 'Date of birth is required' : null,
                      decoration: InputDecoration(
                          icon: Icon(
                            FontAwesomeIcons.calendar,
                            color: Colors.greenAccent,
                          ),
                          hintText: "Set deadline",
                          border: InputBorder.none),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 50,
                  width: size.width * 0.85,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(29),
                      color: Colors.greenAccent.withOpacity(0.3)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 8.0),
                    child: TextFormField(
                      controller: _setMoneyController,
                      decoration:
                          InputDecoration(hintText: _setMoneyController.text,border: InputBorder.none),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.25,
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
      ),
    );
  }
}
