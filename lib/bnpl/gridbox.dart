import 'package:flutter/widgets.dart';

import 'package:projectdojo/bnpl/gridproduct.dart';

class GridBox with ChangeNotifier {
  


List<GridProduct> _grider = [
  GridProduct(
    title: 'Phones and tablets',
    image: 'assets/hoteli.jpg',
    
  ),
  GridProduct(
    title: 'Appliances',
    image: 'assets/hoteli.jpg',
    
  ),
  GridProduct(
    title: 'Home & Furniture',
    image: 'assets/hoteli.jpg',
   
  ),
  GridProduct(
    title: 'Computers',
    image: 'assets/hoteli.jpg',
   
  ),
  GridProduct(
    title: 'Motor Vehicles',
    image: 'assets/hoteli.jpg',
   
  ),
  GridProduct(
    title: 'Clothes',
    image: 'assets/hoteli.jpg',
   
  ),
];
List <GridProduct> get grider{
  return [..._grider];
}
}