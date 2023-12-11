import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const UserModel._();
  factory UserModel({
    final String? id,
    final String? name,
    final String? email,
    final String? phoneNumber,
    final String? photoUrl,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  factory UserModel.fromFirebaseUser(auth.User user) {
    return UserModel(
      id: user.uid,
      name: user.displayName,
      email: user.email,
      phoneNumber: user.phoneNumber,
      photoUrl: user.photoURL,
    );
  }
}
