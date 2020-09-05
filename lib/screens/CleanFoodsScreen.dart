import 'package:dirty_dozen/UI/FoodGridList.dart';
import 'package:dirty_dozen/data/foods.dart';
import 'package:dirty_dozen/models/Food.dart';
import 'package:flutter/material.dart';

import 'Screen.dart';

class CleanFoodsScreen extends Screen {
  MaterialColor color() => Colors.green;
  IconData icon() => Icons.thumb_up;
  String routeName() => 'clean';
  String title() => 'Clean Fifteen';
  String navbarLabel() => 'Clean';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: FoodGridList(cleanFoods, FoodCategory.dirty));
  }
}