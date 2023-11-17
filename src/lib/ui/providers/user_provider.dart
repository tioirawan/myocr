import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/models/user_model.dart';

part 'user_provider.g.dart';

@riverpod
class UserNotifier extends _$UserNotifier {
  @override
  Stream<UserModel?> build() => Stream.value(UserModel());

  Future<void> register() async {
    // TODO: implement register
  }

  Future<void> login() async {
    // TODO: implement login
  }
}
