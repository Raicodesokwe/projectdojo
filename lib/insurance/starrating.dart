import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StarRating extends StatefulWidget {
  final int maximumRating;
  final Function(int) onRatingSelected;

  StarRating(this.onRatingSelected, [this.maximumRating = 5]);

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  int _currentRating = 0;
  _buildRatingStar(int index) {
    if (index < _currentRating) {
      return Icon(
        FontAwesomeIcons.solidStar,
        size: 18,
        color: const Color(0xFFFEC18A),
      );
    } else {
      return Icon(FontAwesomeIcons.star,size: 18,);
    }
  }

  _buildBody() {
    //we are in a different private class mantaining the state thus we have to call it from outside
    final stars = List<Widget>.generate(this.widget.maximumRating, (index) {
      //function to be called everytime loop is run
      return GestureDetector(
        child: _buildRatingStar(index),
        onTap: () {
          setState(() {
            _currentRating = index + 1;
          });
        },
      );
    });
    return Row(
      children: stars,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }
}
