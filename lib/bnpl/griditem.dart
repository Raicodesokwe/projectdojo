import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  final String title;
  final String image;

  const GridItem(this.title, this.image);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
        footer: GridTileBar(backgroundColor: Colors.black87,title: Text(title,textAlign: TextAlign.center,),),
      ),
    );
  }
}
