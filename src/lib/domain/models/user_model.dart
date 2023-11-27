import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    final String? id,
    final String? name,
    final String? email,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  factory UserModel.fromCredential(UserCredential credential) {
    return UserModel(
      id: credential.user!.uid,
      name: credential.user!.displayName,
      email: credential.user!.email,
    );
  }
}
