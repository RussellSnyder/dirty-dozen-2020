import 'package:dirty_dozen/UI/FoodGridList.dart';
import 'package:dirty_dozen/data/foods.dart';
import 'package:dirty_dozen/models/Food.dart';
import 'package:flutter/material.dart';

import 'Screen.dart';

class DirtyFoodsScreen extends Screen {
  MaterialColor color() => Colors.red;
  IconData icon() => Icons.warning;
  String routeName() => 'dirty';
  String title() => 'Dirty Dozen';
  String navbarLabel() => 'Dirty';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: FoodGridList(dirtyFoods, FoodCategory.dirty));
  }
}
