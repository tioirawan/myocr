import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cv_data_model.freezed.dart';
part 'cv_data_model.g.dart';

@freezed
class CvDataModel with _$CvDataModel {
  const CvDataModel._();

  @JsonSerializable(explicitToJson: true)
  factory CvDataModel({
    @JsonKey(name: 'identity_card_id') String? identityCardId,
    int? workExperience,
    int? skills,
    int? location,
    int? organization,
    int? age,
    int? gpa,
  }) = _CvDataModel;

  factory CvDataModel.fromJson(Map<String, dynamic> json) =>
      _$CvDataModelFromJson(json);

  Map<String, dynamic> toDocument() => toJson()
    ..remove('identity_card_id')
    ..update(
      'created_at',
      (_) => Timestamp.now(),
    );

  factory CvDataModel.fromSnapshot(DocumentSnapshot<Object?> snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return CvDataModel.fromJson(data);
  }
}
