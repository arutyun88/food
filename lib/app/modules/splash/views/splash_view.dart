import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/app_colors.dart';
import '../../../core/texts_const.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              loading,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: AppColors.text,
              ),
            ),
            Obx(
              () => Text(
                '${controller.counter.value}',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: AppColors.text,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
