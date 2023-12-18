import 'dart:typed_data';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/models/user_model.dart';
import '../../domain/repositories/user_repository.dart';

part 'user_provider.g.dart';

@Riverpod(keepAlive: true)
class UserNotifier extends _$UserNotifier {
  @override
  FutureOr<UserModel?> build() async =>
      await ref.read(userRepositoryProvider).currentUser();

  UserRepository get _repository => ref.read(userRepositoryProvider);

  Future<void> register(String username, String email, String password) async {
    state = await AsyncValue.guard(
      () => _repository.register(username, email, password),
    );
  }

  Future<void> login(String email, String password) async {
    state = await AsyncValue.guard(
      () => _repository.login(email, password),
    );
  }

  Future<void> loginWithGoogle() async {
    state = await AsyncValue.guard(
      () => _repository.loginWithGoogle(),
    );
  }

  Future<void> updateProfile(
    UserModel user, {
    String? password,
    Uint8List? photoImage,
  }) async {
    state = await AsyncValue.guard(
      () => _repository.updateProfile(
        user,
        password: password,
        photoImage: photoImage,
      ),
    );
  }

  Future<void> logout() async {
    final user = state.value;

    state = const AsyncValue.data(null);

    final success = await _repository.logout();

    if (!success) {
      state = AsyncValue.data(user);
    }
  }
}
