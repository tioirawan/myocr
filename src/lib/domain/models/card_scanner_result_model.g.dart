// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_scanner_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CardScannerResultModelImpl _$$CardScannerResultModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CardScannerResultModelImpl(
      croppedImage: CardScannerResultModel._bytesFromJson(
          json['croppedImage'] as String?),
      photoImage:
          CardScannerResultModel._bytesFromJson(json['photoImage'] as String?),
      identityCard: json['identityCard'] == null
          ? null
          : IdentityCardModel.fromJson(
              json['identityCard'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CardScannerResultModelImplToJson(
        _$CardScannerResultModelImpl instance) =>
    <String, dynamic>{
      'croppedImage':
          CardScannerResultModel._bytesToJson(instance.croppedImage),
      'photoImage': CardScannerResultModel._bytesToJson(instance.photoImage),
      'identityCard': instance.identityCard,
    };
