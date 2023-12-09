// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identity_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IdentityCardModelImpl _$$IdentityCardModelImplFromJson(
        Map<String, dynamic> json) =>
    _$IdentityCardModelImpl(
      id: json['id'] as String?,
      cardImageUrl: json['cardImageUrl'] as String?,
      cardPhotoUrl: json['cardPhotoUrl'] as String?,
      nik: json['nik'] as String?,
      name: json['name'] as String?,
      birthPlace: json['birthPlace'] as String?,
      birthDate:
          IdentityCardModel._birthDateFromJson(json['birthDate'] as String?),
      gender: json['gender'] as String?,
      bloodType: json['bloodType'] as String?,
      streetAdress: json['streetAdress'] as String?,
      rtNumber: json['rtNumber'] as String?,
      rwNumber: json['rwNumber'] as String?,
      village: json['village'] as String?,
      subDistrict: json['subDistrict'] as String?,
      district: json['district'] as String?,
      religion: json['religion'] as String?,
      maritalStatus: json['maritalStatus'] as String?,
      job: json['job'] as String?,
      nationality: json['nationality'] as String?,
      validUntil: json['validUntil'] as String?,
    );

Map<String, dynamic> _$$IdentityCardModelImplToJson(
        _$IdentityCardModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cardImageUrl': instance.cardImageUrl,
      'cardPhotoUrl': instance.cardPhotoUrl,
      'nik': instance.nik,
      'name': instance.name,
      'birthPlace': instance.birthPlace,
      'birthDate': instance.birthDate?.toIso8601String(),
      'gender': instance.gender,
      'bloodType': instance.bloodType,
      'streetAdress': instance.streetAdress,
      'rtNumber': instance.rtNumber,
      'rwNumber': instance.rwNumber,
      'village': instance.village,
      'subDistrict': instance.subDistrict,
      'district': instance.district,
      'religion': instance.religion,
      'maritalStatus': instance.maritalStatus,
      'job': instance.job,
      'nationality': instance.nationality,
      'validUntil': instance.validUntil,
    };
