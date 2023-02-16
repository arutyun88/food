import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_model.freezed.dart';

part 'food_model.g.dart';

@freezed
class FoodModel with _$FoodModel {
  const factory FoodModel({
    double? clr,
    double? prtn,
    double? ft,
    double? tcrb,
    double? sgr,
    double? gl,
    String? nm,
  }) = _FoodModel;

  factory FoodModel.fromJson(Map<String, dynamic> json) =>
      _$FoodModelFromJson(json);
}
