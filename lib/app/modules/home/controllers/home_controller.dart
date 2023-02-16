import 'package:food/app/modules/home/entities/food_entity.dart';
import 'package:get/get.dart';

import '../../../data/models/food_model.dart';
import '../../../data/providers/food_provider.dart';
import '../../../data/services/food_service.dart';

class HomeController extends GetxController {
  HomeController({
    required FoodProvider foodProvider,
    required FoodService foodService,
  })  : _foodProvider = foodProvider,
        _foodService = foodService;

  final FoodProvider _foodProvider;
  final FoodService _foodService;

  var entities = <FoodEntity>[].obs;

  @override
  void onInit() {
    super.onInit();
    _getFoods();
  }

  void _getFoods() async {
    final foods = await _foodProvider.getFoods();
    final favourites = await _foodService.load();
    final List<FoodModel>? remoteResult = foods.fold((l) => null, (r) => r);
    if (remoteResult != null) {
      for (final item in remoteResult) {
        if (favourites.contains(item)) {
          entities.add(FoodEntity(item, favourites: true));
        } else {
          entities.add(FoodEntity(item, favourites: false));
        }
      }
    }
  }

  void changeValue(FoodEntity entity) {
    entities.value = entities.map((element) {
      if(element.food == entity.food) {
        return entity;
      }
      return element;
    }).toList();
  }
}
