import 'package:flutter/material.dart';

class ScreenDetails {
  // ignore: missing_return
  String routeName() {}
  // ignore: missing_return
  String title() {}
  // ignore: missing_return
  String navbarLabel() {}
  // ignore: missing_return
  IconData icon() {}
  // ignore: missing_return
  MaterialColor color() {}
}

abstract class Screen extends StatelessWidget implements ScreenDetails {}
