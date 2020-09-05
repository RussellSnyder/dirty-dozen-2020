enum FoodCategory {
  dirty,
  clean
}

class Food {
  final String id;
  final String name;
  final String image;
  final FoodCategory category;
  final bool isPlural;

  Food(this.id, this.name, this.category, this.image, this.isPlural);
}