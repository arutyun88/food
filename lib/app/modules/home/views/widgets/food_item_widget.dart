import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_icons.dart';
import '../../../../routes/app_pages.dart';
import '../../controllers/home_controller.dart';
import '../../entities/food_entity.dart';

class FoodItemWidget extends StatelessWidget {
  const FoodItemWidget(
    this.entity, {
    Key? key,
  }) : super(key: key);

  final FoodEntity entity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          Get.toNamed(Routes.DETAIL, arguments: entity)?.then(
            (value) {
              if (value != null) {
                Get.find<HomeController>().changeValue(value as FoodEntity);
              }
            },
          );
        },
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    entity.food.nm ?? '',
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                      color: AppColors.text,
                    ),
                  ),
                  Text(_energyValue(entity),
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: AppColors.accent,
                      )),
                ],
              ),
            ),
            entity.favourites
                ? SizedBox(
                    height: 52.0,
                    width: 52.0,
                    child: Center(
                      child: SvgPicture.asset(AppIcons.favouritesIcon),
                    ),
                  )
                : const SizedBox(height: 52.0, width: 52.0)
          ],
        ),
      ),
    );
  }

  String _energyValue(FoodEntity entity) {
    final food = entity.food;
    return '100g/${(food.clr ?? 0).toInt()} Kcal; '
        '${(food.ft ?? 0.0).toStringAsFixed(1)}g fat';
  }
}
