
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column (
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Text>[
        Text(
          "About Improv Assistant",
          style: TextStyle(fontSize: 30),
        ),
        Text("This app was originally created by Sarah Silva for Made Up Theatre in Fremont, California."),
        Text("The show generator randomly selects games from these categories:"),
        Text(
          "First half:",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text("1. Opening"),
        Text("2. Scene"),
        Text("3. Scene"),
        Text("4. Audience"),
        Text("5. Musical"),
        Text("6. Guessing"),
        Text("7. Closing"),
        Text(
          "Second half:",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text("1. After Intermission, Opening, Host Interrupt"),
        Text("2. Misc"),
        Text("3. Scene, Misc"),
        Text("4. Stand in a Line"),
        Text("5. Closing"),
    ],
  );
}

}