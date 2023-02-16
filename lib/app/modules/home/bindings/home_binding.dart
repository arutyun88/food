import 'package:food/app/data/providers/food_provider.dart';
import 'package:food/app/data/services/food_service.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FoodProvider>(() => FoodProvider());

    Get.lazyPut<FoodService>(() => FoodService());

    Get.put<HomeController>(
      HomeController(
        foodProvider: Get.find<FoodProvider>(),
        foodService: Get.find<FoodService>(),
      ),
    );
  }
}
