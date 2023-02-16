import 'package:food/app/data/models/food_model.dart';

class FoodEntity {
  final FoodModel food;
  bool favourites;

  FoodEntity(
    this.food, {
    required this.favourites,
  });
}
