import 'package:flutter/material.dart';
import 'package:projectdojo/services/authservice.dart';
import 'package:projectdojo/services/changethemebutton.dart';
import 'package:projectdojo/stonks/search.dart';

import '../loginpage.dart';

class HomeDrop extends StatelessWidget {
  const HomeDrop({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      underline: Container(),
      onChanged: (onitem) {
        //this function gets the item identifier which is the value we specified in the value parameter
        if (onitem == 'logout') {
          AuthService().signOut();
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => LoginPage()));
        
        }
        if (onitem == 'Deposit') {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => SearchStonk()));
          
        }
      },
      items: [
        //value acts as an identifier
        DropdownMenuItem(
            value: 'logout',
            child: Container(
              child: Row(
                children: [
                  Icon(
                    Icons.exit_to_app,
                    color: Colors.green[300],
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text('Logout')
                ],
              ),
            )),
        DropdownMenuItem(
            value: 'Deposit',
            child: Container(
              child: Row(
                children: [
                  Icon(
                    Icons.add,
                    color: Colors.green[300],
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text('Deposit')
                ],
              ),
            )),
        DropdownMenuItem(
            value: 'Dark',
            child: Container(
              child: Row(
                children: [
                  ChangeThemeButtonWidget(),
                  SizedBox(
                    width: 8,
                  ),
                  Text('Dark')
                ],
              ),
            ))
      ],
      icon: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
           
            color: Colors.greenAccent.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10.0)),
        child: Icon(
          Icons.more_vert,
          color: Colors.green[300],
        ),
      ),
    );
  }
}