import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/models/user_model.dart';
import '../../domain/repositories/user_repository.dart';

part 'user_provider.g.dart';

@riverpod
class UserNotifier extends _$UserNotifier {
  @override
  UserModel? build() => null;

  UserRepository get _repository => ref.read(userRepositoryProvider);

  Future<void> register(String username, String email, String password) async {
    state = await _repository.register(username, email, password);
  }

  Future<void> login(String username, String password) async {
    state = await _repository.login(username, password);
  }
}