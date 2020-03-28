import 'package:flutter/material.dart';
import 'package:improv_app/nav.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Improv Assistant',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: NavPage(),
    );
  }
}