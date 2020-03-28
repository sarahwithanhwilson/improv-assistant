import 'package:flutter/material.dart';
import 'package:improv_app/libraries/constants.dart' as constants;

class HomePage extends StatelessWidget {
  final Function setPage;

  HomePage({this.setPage});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 1,
      childAspectRatio: 100 / 50,
      mainAxisSpacing: 10,
      children: <Widget>[
        InkWell(
          onTap: () {
            setPage(constants.SHOW_GENERATOR);
          },
          child: Container(
            color: Colors.lime[100],
            padding: EdgeInsets.all(8),
            child: Center(
              child: Text(
                'Random Show Generator',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            setPage(constants.GAMES);
          },
          child: Container(
            color: Colors.lime[200],
            padding: EdgeInsets.all(8),
            child: Center(
              child: Text(
                'Pick a Game',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            setPage(constants.SUGGESTIONS);
          },
          child: Container(
            color: Colors.lime[300],
            padding: EdgeInsets.all(8),
            child: Center(
              child: Text(
                'Get Suggestions',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
        ),
      ],
    );
  }
}