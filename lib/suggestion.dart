import 'dart:math';
import 'package:flutter/material.dart';
import 'package:improv_app/libraries/suggestions_by_category.dart' as s;

class Suggestion extends StatefulWidget {
  @override
  SuggestionState createState() => SuggestionState();
}

class SuggestionState extends State<Suggestion> {
  String randomSuggestion = 'Select a category';

  _handleRandomSuggestionButton(String category) {
    var suggestions = [];
    if (category == 'any') {
      var values = s.suggestionsByCategory.values.toList();
      // flatten values to be an un-nested list
      suggestions = values.expand((game) => game).toList();
    } else {
      suggestions = s.suggestionsByCategory[category];
    }
    Random random = new Random();
    var index = random.nextInt(suggestions.length);
    setState(() {
      randomSuggestion = suggestions[index].toUpperCase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 90,
          padding: EdgeInsets.all(8),
          child: Center(
            child: Text(
              "$randomSuggestion",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28, color: Colors.indigo[700]),
            ),
          ),
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 1,
            childAspectRatio: 100 / 19,
            mainAxisSpacing: 10,
            children: <Widget>[
              InkWell(
                onTap: () {
                  this._handleRandomSuggestionButton('any');
                },
                child: Container(
                  color: Colors.lime[100],
                  padding: EdgeInsets.all(8),
                  child: Center(
                    child: Text(
                      'Any suggestion',
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  this._handleRandomSuggestionButton('locations');
                },
                child: Container(
                  color: Colors.lime[200],
                  padding: EdgeInsets.all(8),
                  child: Center(
                    child: Text(
                      'Locations',
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  this._handleRandomSuggestionButton('people');
                },
                child: Container(
                  color: Colors.lime[200],
                  padding: EdgeInsets.all(8),
                  child: Center(
                    child: Text(
                      'People',
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  this._handleRandomSuggestionButton('things');
                },
                child: Container(
                  color: Colors.lime[300],
                  padding: EdgeInsets.all(8),
                  child: Center(
                    child: Text(
                      'Things',
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
