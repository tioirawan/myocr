import '../../domain/models/user_model.dart';
import '../../domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<UserModel?> register(
      String username,
      String email,
      String password,
      ) async {
    return UserModel();
  }

  @override
  Future<UserModel?> login(
      String username,
      String password,
      ) async {
    return UserModel();
  }

  @override
  Future<bool> logout() async {
    return true;
  }

  @override
  Future<UserModel?> currentUser() async {
    return UserModel();
  }
}