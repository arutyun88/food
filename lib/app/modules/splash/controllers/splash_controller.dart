import 'dart:async';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

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
