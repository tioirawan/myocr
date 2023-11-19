import 'package:freezed_annotation/freezed_annotation.dart';

part 'identity_card_model.freezed.dart';
part 'identity_card_model.g.dart';

@freezed
class IdentityCardModel with _$IdentityCardModel {
  factory IdentityCardModel({
    final String? id,
    final String? cardImageUrl,
    final String? cardPhotoUrl,
    final String? nik,
    final String? name,
    final String? birthPlace,
    final DateTime? birthDate,
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
  }) = _IdentityCardModel;

  factory IdentityCardModel.fromJson(Map<String, dynamic> json) =>
      _$IdentityCardModelFromJson(json);
}
