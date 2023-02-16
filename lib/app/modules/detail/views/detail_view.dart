import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_colors.dart';
import '../../../core/texts_const.dart';
import '../../home/entities/food_entity.dart';
import '../controllers/detail_controller.dart';
import 'widgets/calories_facts_widget.dart';
import 'widgets/other_facts_widget.dart';

class DetailView extends GetView<DetailController> {
  DetailView({
    Key? key,
  }) : super(key: key);

  final FoodEntity entity = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(CupertinoIcons.left_chevron, color: AppColors.blue),
        ),
      ),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entity.food.nm ?? '',
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w500,
                          color: AppColors.text,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(22.0),
                        child: Placeholder(
                            fallbackWidth: 107.0, fallbackHeight: 107.0),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          nutritionFacts,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400,
                            color: AppColors.text,
                          ),
                        ),
                      ),
                      CaloriesFactsWidget(entity),
                      OtherFactsWidget(entity),
                    ],
                  ),
                ),
              ),
            ),
            CupertinoButton(
              onPressed: () {},
              minSize: 0.0,
              padding: EdgeInsets.zero,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 30.0),
                padding: const EdgeInsets.symmetric(
                  vertical: 14.0,
                  horizontal: 24.0,
                ),
                decoration: BoxDecoration(
                  color: AppColors.accent,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text(
                    entity.favourites ? removeFromFavorites : saveToFavorites,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
