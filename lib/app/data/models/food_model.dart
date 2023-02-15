import 'package:freezed_annotation/freezed_annotation.dart';

import 'mmt_model.dart';

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
    double? clrj,
    double? ncrb,
    List<String>? als,
    String? src,
    String? sgm,
    String? gr,
    String? nm,
    MmtModel? mmt,
  }) = _FoodModel;

  factory FoodModel.fromJson(Map<String, Object?> json) =>
      _$FoodModelFromJson(json);
}
