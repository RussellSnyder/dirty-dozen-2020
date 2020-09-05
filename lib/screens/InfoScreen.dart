import 'package:flutter/material.dart';

import 'Screen.dart';

class InfoScreen extends Screen {
  MaterialColor color() => Colors.brown;
  IconData icon() => Icons.info_outline;
  String routeName() => 'info';
  String title() => 'What is this about?';
  String navbarLabel() => 'Info';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text('Informatino about this app'));
  }
}