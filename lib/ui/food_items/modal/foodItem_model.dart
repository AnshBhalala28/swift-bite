class FoodItemModel {
  final String name;
  final String category;
  final String timing;
  final double price;
  final double rating;
  final String image;
  final bool isFavourite;

  FoodItemModel({
    required this.name,
    required this.category,
    required this.timing,
    required this.price,
    required this.rating,
    required this.image,
    this.isFavourite = false,
  });
}