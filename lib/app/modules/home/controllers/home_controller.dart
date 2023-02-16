import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/texts_const.dart';
import '../../../data/models/food_model.dart';
import '../../../data/providers/food_provider.dart';
import '../../../data/services/food_service.dart';
import '../entities/food_entity.dart';

class HomeController extends GetxController with WidgetsBindingObserver {
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
    WidgetsBinding.instance.addObserver(this);
    _getFoods();
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.detached ||
        state == AppLifecycleState.inactive) return;

    if (state == AppLifecycleState.paused) {
      int counter = 2;
      Timer.periodic(
        const Duration(seconds: 1),
        (timer) {
          counter -= 1;
          if (counter == 0) {
            AwesomeNotifications().createNotification(
              content: NotificationContent(
                id: 1,
                channelKey: notificationChannelKey,
                title: hello,
                body: weMissYou,
              ),
            );
            timer.cancel();
          }
        },
      );
    }
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
      if (element.food == entity.food) {
        return entity;
      }
      return element;
    }).toList();
  }
}
