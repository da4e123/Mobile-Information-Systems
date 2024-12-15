import 'package:flutter/material.dart';
import 'package:lab2/screens/main_screen.dart';
import 'package:lab2/screens/random_joke_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Шеги',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {
        RandomJokeScreen.routeName: (ctx) => RandomJokeScreen(),
      },
    );
  }
}

void main() {
  runApp(MyApp());
}