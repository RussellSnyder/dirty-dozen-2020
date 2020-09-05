import 'package:dirty_dozen/models/Food.dart';
import 'package:dirty_dozen/screens/FoodDetailsScreen.dart';
import 'package:flutter/material.dart';

class FoodGridList extends StatelessWidget {
  FoodGridList(this.foods, this.category);

  final List<Food> foods;
  final FoodCategory category;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: EdgeInsets.all(10),
        children: <Widget>[
          ...foods.map((Food food) => GridTile(
                footer: Material(
                  color: Colors.transparent,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(4)),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: GridTileBar(
                    backgroundColor: Colors.black45,
                    title: Text(food.name),
                    // subtitle: _GridTitleText(photo.subtitle),
                  ),
                ),
                child: Hero(
                  tag: food.id,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => Navigator.pushNamed(
                        context,
                        FoodDetailsScreen.routeName,
                        arguments: FoodDetailsScreenArguments(food),
                      ),
                      child: Image.asset(
                        'assets/food_images/' + food.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              )),
        ]);
  }
}
