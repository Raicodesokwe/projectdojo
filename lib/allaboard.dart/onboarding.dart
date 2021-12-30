import 'package:flutter/widgets.dart';
import 'package:projectdojo/allaboard.dart/onboard.dart';

class Onboarder with ChangeNotifier {
  


List<Onboard> _contents = [
  Onboard(
    title: 'Grow your funds',
    image: 'assets/onboardone.json',
    description: "With our suite of investment products, you have the perfect partner for the journey to financial security"
  ),
  Onboard(
    title: 'Security',
    image: 'assets/onboardsecurity.json',
    description: "Two factor authentication,biometric authentication and fraud detection algorithms are some of the mechanisms we have put in place to ensure the safety of your money "
  ),
  Onboard(
    title: 'Save!! Save!! Save!!',
    image: 'assets/onboardsavings.json',
    description: "You can set different saving goals plans and even better,you can get up to 10% annual return on your money. Sounds fantastic, right?Dive right in  "
  ),
];
List <Onboard> get contents{
  return [..._contents];
}
}