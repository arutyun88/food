import 'package:freezed_annotation/freezed_annotation.dart';

part 'mmt_model.freezed.dart';

part 'mmt_model.g.dart';

@freezed
class MmtModel with _$MmtModel {
  const factory MmtModel({
    String? u,
    double? q,
    double? s,
    double? g,
    bool? df,
  }) = _MmtModel;

  factory MmtModel.fromJson(Map<String, Object?> json) =>
      _$MmtModelFromJson(json);
}
