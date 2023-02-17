import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrx_charts/mrx_charts.dart';

import '../../../../core/app_colors.dart';
import '../../entities/fact_type.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({
    Key? key,
    required this.values,
    required this.calories,
  }) : super(key: key);

  final Map<FactType, double> values;
  final double calories;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: SizedBox(
          height: 140.0,
          width: 140.0,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Chart(
                layers: [
                  ChartGroupPieLayer(
                    items: [
                      List.generate(
                        values.keys.length,
                        (index) {
                          final key = values.keys.toList()[index];
                          return ChartGroupPieDataItem(
                            amount: values[key]!,
                            color: _getColor(key),
                            label: titleByFact(key),
                          );
                        },
                      ),
                    ],
                    settings: const ChartGroupPieSettings(gapSweepAngle: 15.0),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${calories.round().toInt()}',
                    style: context.textTheme.headlineSmall,
                  ),
                  Text('kcal', style: context.textTheme.titleMedium),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getColor(FactType type) {
    if (type == FactType.protein) {
      return AppColors.blue;
    } else if (type == FactType.fat) {
      return AppColors.orange;
    } else {
      return AppColors.violet;
    }
  }
}
