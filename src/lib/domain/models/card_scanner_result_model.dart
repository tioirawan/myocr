import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'identity_card_model.dart';

part 'card_scanner_result_model.freezed.dart';
part 'card_scanner_result_model.g.dart';

@freezed
class CardScannerResultModel with _$CardScannerResultModel {
  factory CardScannerResultModel({
    @JsonKey(
      fromJson: CardScannerResultModel._bytesFromJson,
      toJson: CardScannerResultModel._bytesToJson,
    )
    Uint8List? croppedImage,
    @JsonKey(
      fromJson: CardScannerResultModel._bytesFromJson,
      toJson: CardScannerResultModel._bytesToJson,
    )
    Uint8List? photoImage,
    IdentityCardModel? identityCard,
  }) = _CardScannerResultModel;

  factory CardScannerResultModel.fromJson(Map<String, dynamic> json) =>
      _$CardScannerResultModelFromJson(json);

  // convert to base64
  static Uint8List? _bytesFromJson(String? base64) {
    if (base64 == null) return null;
    return base64Decode(base64);
  }

  // convert from base64
  static String? _bytesToJson(Uint8List? file) {
    if (file == null) return null;
    return base64Encode(file);
  }
}
