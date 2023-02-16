import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_colors.dart';
import '../../../home/entities/food_entity.dart';
import '../../entities/fact_type.dart';

class CaloriesFactsWidget extends StatelessWidget {
  const CaloriesFactsWidget(
    this.entity, {
    Key? key,
  }) : super(key: key);

  final FoodEntity entity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
        bottom: 8.0,
        left: 4.0,
        right: 36.0,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                titleByFact(FactType.calories),
                style: context.textTheme.bodyLarge,
              ),
              Text(
                getTextByValue(FactType.calories, entity.food.clr),
                style: context.textTheme.bodyLarge,
              )
            ],
          ),
          _FactItem(type: FactType.protein, value: entity.food.prtn),
          _FactItem(type: FactType.fat, value: entity.food.ft),
          _FactItem(type: FactType.totalCarbs, value: entity.food.tcrb),
        ],
      ),
    );
  }
}

class _FactItem extends StatelessWidget {
  const _FactItem({
    Key? key,
    required this.type,
    required this.value,
  }) : super(key: key);

  final FactType type;
  final dynamic value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: type == FactType.protein
                      ? AppColors.blue
                      : type == FactType.fat
                          ? AppColors.orange
                          : AppColors.violet,
                  shape: BoxShape.circle,
                ),
                height: 8,
                width: 8,
              ),
              Text(titleByFact(type), style: context.textTheme.bodyLarge),
            ],
          ),
          Text(getTextByValue(type, value), style: context.textTheme.bodyLarge)
        ],
      ),
    );
  }
}
