import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
            Text(loading, style: context.theme.textTheme.headlineLarge),
            Obx(
              () => Text(
                '${controller.counter.value}',
                style: context.theme.textTheme.headlineLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
