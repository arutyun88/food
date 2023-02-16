import 'package:flutter/material.dart';
import 'package:mrx_charts/mrx_charts.dart';

import '../../../../core/app_colors.dart';
import '../../entities/fact_type.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({
    Key? key,
    required this.values,
  }) : super(key: key);

  // final List<Map<FactType, double>> values;
  final Map<FactType, double> values;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: SizedBox(
          height: 107.0,
          width: 107.0,
          child: Chart(
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
