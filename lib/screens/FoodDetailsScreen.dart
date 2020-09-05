import 'package:dirty_dozen/models/Food.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodDetailsScreenArguments {
  final Food food;

  FoodDetailsScreenArguments(this.food);
}

class FoodDetailsScreen extends StatelessWidget {
  static const routeName = '/food_details';

  @override
  Widget build(BuildContext context) {
    final FoodDetailsScreenArguments args =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(args.food.name),
          backgroundColor: args.food.category == FoodCategory.dirty
              ? Colors.red
              : Colors.green),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
                tag: args.food.id,
                child: Image(
                    image:
                        AssetImage('assets/food_images/' + args.food.image))),
            Text(
              args.food.name + ' is delicious',
            ),
          ],
        ),
      ),
    );
  }
}
