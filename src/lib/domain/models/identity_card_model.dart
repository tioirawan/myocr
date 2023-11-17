import 'package:freezed_annotation/freezed_annotation.dart';

part 'identity_card_model.freezed.dart';
part 'identity_card_model.g.dart';

@freezed
class IdentityCardModel with _$IdentityCardModel {
  factory IdentityCardModel() = _IdentityCardModel;

  factory IdentityCardModel.fromJson(Map<String, dynamic> json) =>
      _$IdentityCardModelFromJson(json);
}
