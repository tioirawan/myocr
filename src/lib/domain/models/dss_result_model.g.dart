// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dss_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DssResultModelImpl _$$DssResultModelImplFromJson(Map<String, dynamic> json) =>
    _$DssResultModelImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      score: (json['score'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$DssResultModelImplToJson(
        _$DssResultModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'score': instance.score,
    };
