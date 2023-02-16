enum FactType {
  calories,
  protein,
  fat,
  totalCarbs,
  sugar,
  glycemicLoad,
}

String titleByFact(FactType type) {
  switch (type) {
    case FactType.calories:
      return 'Calories';
    case FactType.protein:
      return 'Protein';
    case FactType.fat:
      return 'Fat';
    case FactType.totalCarbs:
      return 'Total Carbs';
    case FactType.sugar:
      return 'Sugar';
    case FactType.glycemicLoad:
      return 'Glycemic Load';
  }
}

String getTextByValue(FactType type, dynamic value) {
  switch (type) {
    case FactType.calories:
      return '${(value ?? 0.0).round().toInt()} kcal';
    case FactType.protein:
    case FactType.totalCarbs:
    case FactType.sugar:
      return '${(value ?? 0.0).round().toInt()} g';
    case FactType.fat:
      return '${(value ?? 0.0).toStringAsFixed(1)} g';
    case FactType.glycemicLoad:
      return '${(value ?? 0.0).round().toInt()}';
  }
}
