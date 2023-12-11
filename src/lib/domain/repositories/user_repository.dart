import 'dart:typed_data';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/user_repository_impl.dart';
import '../models/user_model.dart';
import '../services/firebase_services.dart';

part 'user_repository.g.dart';

abstract class UserRepository {
  Future<UserModel?> register(String username, String email, String password);
  Future<UserModel?> login(String email, String password);
  Future<UserModel?> loginWithGoogle();
  Future<UserModel?> updateProfile(
    UserModel user, {
    String? password,
    Uint8List? photoImage,
  });
  Future<UserModel?> currentUser();
  Future<bool> logout();
}

@riverpod
UserRepository userRepository(UserRepositoryRef ref) {
  final auth = ref.watch(firebaseAuthProvider);
  final firestore = ref.watch(firebaseFirestoreProvider);
  final storage = ref.watch(firebaseStorageProvider);

  return UserRepositoryImpl(auth, firestore, storage);
}
