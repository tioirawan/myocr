import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'cv_data_model.dart';

part 'identity_card_model.freezed.dart';
part 'identity_card_model.g.dart';

@freezed
class IdentityCardModel with _$IdentityCardModel {
  const IdentityCardModel._();
  @JsonSerializable(explicitToJson: true)
  factory IdentityCardModel({
    final String? id,
    final String? cardImageUrl,
    final String? cardPhotoUrl,
    final String? nik,
    final String? name,
    final String? birthPlace,
    // @JsonKey(fromJson: IdentityCardModel._birthDateFromJson)
    final String? birthDate,
    final String? gender,
    final String? bloodType,
    final String? streetAdress,
    final String? rtNumber,
    final String? rwNumber,
    // keluarahan/desa
    final String? village,
    // kecamatan
    final String? subDistrict,
    // kabupaten/kota,
    final String? district,
    final String? religion,
    final String? maritalStatus,
    final String? job,
    final String? nationality,
    final String? validUntil,
    @JsonKey(name: 'cv_data') final CvDataModel? cvData,
    @JsonKey(
      name: 'created_at',
      fromJson: IdentityCardModel._dateTimeFromTimestamp,
    )
    final DateTime? createdAt,
  }) = _IdentityCardModel;

  factory IdentityCardModel.fromJson(Map<String, dynamic> json) =>
      _$IdentityCardModelFromJson(json);

  Map<String, dynamic> toDocument() => toJson()
    ..remove('id')
    ..update(
      'created_at',
      (_) => Timestamp.now(),
    );

  factory IdentityCardModel.fromSnapshot(DocumentSnapshot<Object?> snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return IdentityCardModel.fromJson(data).copyWith(
      id: snapshot.id,
    );
  }

  static DateTime? _birthDateFromJson(String? birthDate) {
    if (birthDate == null) return null;
    final date = birthDate.split('-');
    return DateTime(int.parse(date[2]), int.parse(date[1]), int.parse(date[0]));
  }

  static DateTime? _dateTimeFromTimestamp(Timestamp? timestamp) {
    if (timestamp == null) return null;
    return timestamp.toDate();
  }
}
