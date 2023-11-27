import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/models/user_model.dart';
import '../../domain/repositories/user_repository.dart';

part 'user_provider.g.dart';

@riverpod
class UserNotifier extends _$UserNotifier {
  @override
  FutureOr<UserModel?> build() async =>
      await ref.read(userRepositoryProvider).currentUser();

  UserRepository get _repository => ref.read(userRepositoryProvider);

  Future<void> register(String username, String email, String password) async {
    final user = await _repository.register(username, email, password);

    state = AsyncData(user);
  }

  Future<void> login(String username, String password) async {
    final user = await _repository.login(username, password);

    state = AsyncData(user);
  }
}
