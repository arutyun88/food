import 'dart:async';

import 'package:food/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final counter = 5.obs;

  @override
  void onInit() {
    super.onInit();
    _counter();
  }

  void _counter() {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        counter.value -= 1;
        if (counter.value == 0) {
          timer.cancel();
          Get.offAllNamed(Routes.HOME);
        }
      },
    );
  }
}
