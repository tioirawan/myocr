import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/user_repository_impl.dart';
import '../models/user_model.dart';

part 'user_repository.g.dart';

abstract class UserRepository {
  Future<UserModel?> register(String username, String email, String password);
  Future<UserModel?> login(String username, String password);
  Future<UserModel?> currentUser();
  Future<bool> logout();
}

@riverpod
UserRepository userRepository(UserRepositoryRef ref) {
  return UserRepositoryImpl();
}