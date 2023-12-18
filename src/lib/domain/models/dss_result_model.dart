import 'package:freezed_annotation/freezed_annotation.dart';

part 'dss_result_model.freezed.dart';
part 'dss_result_model.g.dart';

@freezed
class DssResultModel with _$DssResultModel {
  factory DssResultModel({
    final String? id,
    final String? name,
    final double? score,
  }) = _DssResultModel;

  factory DssResultModel.fromJson(Map<String, dynamic> json) =>
      _$DssResultModelFromJson(json);
}
