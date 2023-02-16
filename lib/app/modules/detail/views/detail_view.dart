import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_colors.dart';
import '../../../core/texts_const.dart';
import '../controllers/detail_controller.dart';
import 'widgets/calories_facts_widget.dart';
import 'widgets/other_facts_widget.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Get.back(result: controller.entity.value);
          },
          icon: const Icon(CupertinoIcons.left_chevron, color: AppColors.blue),
        ),
      ),
      body: SafeArea(
        top: false,
        child: Obx(
          () => Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 10.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.entity.value.food.nm ?? '',
                          style: context.textTheme.headlineSmall,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(22.0),
                          child: Placeholder(
                            fallbackWidth: 107.0,
                            fallbackHeight: 107.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            nutritionFacts,
                            style: context.textTheme.titleLarge,
                          ),
                        ),
                        CaloriesFactsWidget(controller.entity.value),
                        OtherFactsWidget(controller.entity.value),
                      ],
                    ),
                  ),
                ),
              ),
              CupertinoButton(
                onPressed: () {
                  controller.entity.value.favourites
                      ? controller
                          .removeFromFavourites(controller.entity.value.food)
                      : controller
                          .addToFavourites(controller.entity.value.food);
                },
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
                      controller.entity.value.favourites
                          ? removeFromFavorites
                          : saveToFavorites,
                      style: context.textTheme.titleLarge?.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
