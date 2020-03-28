import 'dart:math';
import 'package:flutter/material.dart';
import 'package:improv_app/libraries/games_by_category.dart' as g;

class Game extends StatefulWidget {
  @override
  GameState createState() => GameState();
}

class GameState extends State<Game> {
  String randomGame = 'Select a game category';

  _handleRandomGameButton(String category) {
    var games = [];
    if (category == 'any') {
      var values = g.gamesByCategory.values.toList();
      // flatten values to be an un-nested list
      games = values.expand((game) => game).toList();
    } else {
      games = g.gamesByCategory[category];
    }
    Random random = new Random();
    var index = random.nextInt(games.length);
    setState(() {
      randomGame = games[index].toUpperCase();
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
              "$randomGame",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Colors.indigo[700]),
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
                  this._handleRandomGameButton('any');
                },
                child: Container(
                  color: Colors.lime[100],
                  padding: EdgeInsets.all(8),
                  child: Center(
                    child: Text(
                      'Any type of game',
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  this._handleRandomGameButton('scene');
                },
                child: Container(
                  color: Colors.lime[100],
                  padding: EdgeInsets.all(8),
                  child: Center(
                    child: Text(
                      'Scene game',
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  this._handleRandomGameButton('guessing');
                },
                child: Container(
                  color: Colors.lime[200],
                  padding: EdgeInsets.all(8),
                  child: Center(
                    child: Text(
                      'Guessing game',
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  this._handleRandomGameButton('audience');
                },
                child: Container(
                  color: Colors.lime[200],
                  padding: EdgeInsets.all(8),
                  child: Center(
                    child: Text(
                      'Audience participation',
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  this._handleRandomGameButton('musical');
                },
                child: Container(
                  color: Colors.lime[300],
                  padding: EdgeInsets.all(8),
                  child: Center(
                    child: Text(
                      'Musical game',
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  this._handleRandomGameButton('standInALine');
                },
                child: Container(
                  color: Colors.lime[300],
                  padding: EdgeInsets.all(8),
                  child: Center(
                    child: Text(
                      'Stand in a line',
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
