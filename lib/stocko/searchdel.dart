import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projectdojo/alpaca/assets.dart';
import 'package:projectdojo/alpaca/trading.dart';
import 'package:provider/provider.dart';

class MySearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              query = "";
            },
            icon: Icon(FontAwesomeIcons.windowClose))
      ];

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(FontAwesomeIcons.arrowLeft));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<Assets>>(
        future:  TradingService().getAssets(),
        builder: (context, snapshot) {
          var data = snapshot.data;

          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(title: Text('${data[index].symbol}')),
              );
            },
            itemCount: data.length,
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text('Search maan!!'),
    );
  }
}
