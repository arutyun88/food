import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:food/app/core/app_colors.dart';
import 'package:food/app/core/app_theme.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/core/texts_const.dart';
import 'app/routes/app_pages.dart';

void main() async {
  await preloadData();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: AppTheme.light,
    ),
  );
}

Future<void> preloadData() async {
  await AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelGroupKey: notificationChannelGroupKey,
        channelKey: notificationChannelKey,
        channelName: notificationChannelName,
        channelDescription: notificationChannelDescription,
        defaultColor: AppColors.accent,
        ledColor: AppColors.white,
      ),
    ],
    debug: true,
  );

  await AwesomeNotifications().isNotificationAllowed().then(
    (isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    },
  );

  await GetStorage.init();
}
