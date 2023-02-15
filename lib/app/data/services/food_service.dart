import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/food_model.dart';
import 'services_utils.dart';

class FoodService extends GetxService {
  final GetStorage _storage = GetStorage(foodStorageName);

  Future<void> save(FoodModel food) async {
    final foodList = await load();
    if (foodList.contains(food)) return;
    foodList.add(food);
    await _storage.write(
      foodFavouritesKey,
      foodList.map((e) => e.toJson()).toList(),
    );
  }

  Future<List<FoodModel>> load() async {
    final favourites = await _storage.read(foodFavouritesKey);
    if (favourites == null) return <FoodModel>[];
    return (favourites as List).map((e) => FoodModel.fromJson(e)).toList();
  }

  Future<void> clear() async {
    await _storage.remove(foodFavouritesKey);
  }
}
