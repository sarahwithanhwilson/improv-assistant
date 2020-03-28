import 'dart:math';
import 'package:flutter/material.dart';
import 'package:improv_app/libraries/games_by_category.dart' as g;

class ShowGenerator extends StatefulWidget {
  @override
  ShowGeneratorState createState() => ShowGeneratorState();
}

class ShowGeneratorState extends State<ShowGenerator> {
  List selectedGames = [];

  _getRandomGameByType(List categories, [List options]) {
    // get a random game by type
    // pass in any number of categories (string[])
    if (categories.length == 0) return '';
    if (options == null) options = [];
    if (options.length == 1) return options[0];
    if (options.length == 0) {
      for (var i = 0; i < categories.length; i++) {
        var games = g.gamesByCategory[categories[i]];
        if (g.gamesByCategory[categories[i]] != null) {
          options = options + games;
        }
      }
    }
    Random random = new Random();
    var finalIndex = random.nextInt(options.length);
    var game = options[finalIndex];

    if (this.selectedGames.contains(game)) {
      // remove duplicate from index to prevent stack overflow and try again
      options.removeAt(finalIndex);
      return this._getRandomGameByType(categories, options);
    }
    this.selectedGames.add(game);
    return game.toUpperCase();
  }

  // TODO: How can I update the field without an event?
  // Should probably make it a list with each game as a repeated element
  // Then could have better style/layout
  // Plus could update the game on click with the game in the state

//  _replaceGame(e) {
//    print(e);
//    var categoriesStr = e.target.dataset.categories;
//    var categories = categoriesStr.split(' ');
//    var game = this._getRandomGameByType(categories);
//    e.target.textContent = game;
//  }

  //TODO: Add the button to get a new random show

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Random Show Generator",
          style: TextStyle(fontSize: 30),
        ),
        Text(
            "A collection of not-quite-randomly selected short form improv games. Tap a game to replace it with a new one."),
        Expanded(
          child: GridView.count(
            padding: EdgeInsets.fromLTRB(20, 14, 20, 10),
            crossAxisCount: 1,
            childAspectRatio: 100 / 5,
            mainAxisSpacing: 10,
            children: <Widget>[
              Text(
                "First half:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              //        InkWell(
              //          child: Text(this._getRandomGameByType(['opening'])),
              //          onTap: (e) {this._replaceGame(e);},
              //        ),
              Text(this._getRandomGameByType(['opening'])),
              Text(this._getRandomGameByType(['scene'])),
              Text(this._getRandomGameByType(['scene'])),
              Text(this._getRandomGameByType(['audience'])),
              Text(this._getRandomGameByType(['musical'])),
              Text(this._getRandomGameByType(['guessing'])),
              Text(this._getRandomGameByType(['closing'])),
              Text(
                "Second half:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(this._getRandomGameByType(
                  ['afterIntermission', 'opening', 'hostInterrupt'])),
              Text(this._getRandomGameByType(['misc'])),
              Text(this._getRandomGameByType(['scene', 'misc'])),
              Text(this._getRandomGameByType(['standInALine'])),
              Text(this._getRandomGameByType(['closing'])),
              Text(''),
              Text(
                  "Learn more about how the games are picked in the About section of the menu."),
            ],
          ),
        ),
      ],
    );
  }
}
