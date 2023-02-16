import 'package:get/get.dart';

import '../../../data/models/food_model.dart';
import '../../../data/services/food_service.dart';
import '../../home/entities/food_entity.dart';

class DetailController extends GetxController {
  var entity = (Get.arguments as FoodEntity).obs;

  DetailController({
    required FoodService foodService,
  }) : _foodService = foodService;
  final FoodService _foodService;

  Future<void> addToFavourites(FoodModel model) async =>
      await _foodService.add(model).then(
            (value) => entity.value = FoodEntity(model, favourites: true),
          );

  Future<void> removeFromFavourites(FoodModel model) async =>
      await _foodService.remove(model).then(
            (value) => entity.value = FoodEntity(model, favourites: false),
      );

  void clearCache() async => await _foodService.clear();
}
