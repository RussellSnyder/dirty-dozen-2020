enum FoodCategory {
  dirty,
  clean
}

class Food {
  final String id;
  final String name;
  final String image;
  final FoodCategory category;

  Food(this.id, this.name, this.category, this.image);

  Food.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        image = json['image'],
        category = json['category'];

  Map<String, dynamic> toJson() =>
    {
      'id': id,
      'name': name,
      'category': category,
      'image': image,
    };
}