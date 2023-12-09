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
    @JsonKey(fromJson: IdentityCardModel._birthDateFromJson)
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

  static DateTime? _birthDateFromJson(String? birthDate) {
    if (birthDate == null) return null;
    final date = birthDate.split('-');
    return DateTime(int.parse(date[2]), int.parse(date[1]), int.parse(date[0]));
  }
}
