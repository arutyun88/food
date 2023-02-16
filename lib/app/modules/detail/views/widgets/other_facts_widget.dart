import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import '../../../home/entities/food_entity.dart';
import '../../entities/fact_type.dart';

class OtherFactsWidget extends StatelessWidget {
  const OtherFactsWidget(
    this.entity, {
    Key? key,
  }) : super(key: key);

  final FoodEntity entity;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
            bottom: 8.0,
            left: 4.0,
            right: 36.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                titleByFact(FactType.sugar),
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                  color: AppColors.text,
                ),
              ),
              Text(
                getTextByValue(FactType.sugar, entity.food.sgr),
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
            bottom: 8.0,
            left: 4.0,
            right: 36.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                titleByFact(FactType.glycemicLoad),
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                  color: AppColors.text,
                ),
              ),
              Text(
                getTextByValue(FactType.calories, entity.food.gl),
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
