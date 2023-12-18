// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cv_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CvDataModelImpl _$$CvDataModelImplFromJson(Map<String, dynamic> json) =>
    _$CvDataModelImpl(
      identityCardId: json['identity_card_id'] as String?,
      workExperience: json['workExperience'] as int?,
      skills: json['skills'] as int?,
      location: json['location'] as int?,
      organization: json['organization'] as int?,
      age: json['age'] as int?,
      gpa: json['gpa'] as int?,
    );

Map<String, dynamic> _$$CvDataModelImplToJson(_$CvDataModelImpl instance) =>
    <String, dynamic>{
      'identity_card_id': instance.identityCardId,
      'workExperience': instance.workExperience,
      'skills': instance.skills,
      'location': instance.location,
      'organization': instance.organization,
      'age': instance.age,
      'gpa': instance.gpa,
    };
