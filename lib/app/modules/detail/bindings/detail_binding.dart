import 'package:get/get.dart';

import '../../../data/services/food_service.dart';
import '../controllers/detail_controller.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FoodService>(() => FoodService());

    Get.lazyPut<DetailController>(
      () => DetailController(foodService: Get.find<FoodService>()),
    );
  }
}
