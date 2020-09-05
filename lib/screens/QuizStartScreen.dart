import 'package:dirty_dozen/screens/QuizScreen.dart';
import 'package:flutter/material.dart';

import 'Screen.dart';

class QuizStartScreen extends Screen {
  MaterialColor color() => Colors.blue;
  IconData icon() => Icons.school;
  String routeName() => 'quiz';
  String title() => 'Pesticides Quiz';
  String navbarLabel() => 'Quiz';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
          Text('Test your knowledge', style: TextStyle(fontSize: 30)),
          RaisedButton(
            color: Colors.blue,
            textColor: Colors.white,
            disabledColor: Colors.grey,
            disabledTextColor: Colors.black,
            padding: EdgeInsets.all(20.0),
            splashColor: Colors.blueAccent,
            onPressed: () => Navigator.pushNamed(context, QuizScreen.routeName),
            child: Text('Start', style: TextStyle(fontSize: 20)),
          )
        ])));
  }
}
