class FoodItemModel {
  final String name;
  final String category;
  final String timing;
  final double price;
  final double rating;
  final String image;
  final bool isFavourite;

  final String description;
  final List<String> ingredients;
  final int calories;

  FoodItemModel({
    required this.name,
    required this.category,
    required this.timing,
    required this.price,
    required this.rating,
    required this.image,
    this.isFavourite = false,
    required this.description,
    required this.ingredients,
    required this.calories,
  });
}