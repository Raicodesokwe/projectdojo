import 'package:flutter/material.dart';

class CoverPicha extends StatelessWidget {
  const CoverPicha({ Key key,@required this.size }) : super(key: key);
final Size size;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      width: size.width*0.27,
      height: size.height*0.18,
      child: ClipRRect(borderRadius: BorderRadius.circular(10.0),child: Image.asset("assets/hoteli.jpg",fit: BoxFit.fill,),),
    );
  }
}