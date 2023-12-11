import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../domain/models/user_model.dart';
import '../../domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseAuth _auth;

  UserRepositoryImpl(this._auth);

  @override
  Future<UserModel?> register(
    String username,
    String email,
    String password,
  ) async {
    final credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await credential.user?.updateDisplayName(username);
    return UserModel.fromCredential(credential).copyWith(name: username);
  }

  @override
  Future<UserModel?> login(
    String email,
    String password,
  ) async {
    final credential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return UserModel.fromCredential(credential);
  }

  @override
  Future<bool> logout() async {
    try {
      await _auth.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<UserModel?> currentUser() async {
    return _auth.currentUser != null
        ? UserModel(
            id: _auth.currentUser!.uid,
            name: _auth.currentUser!.displayName,
            email: _auth.currentUser!.email,
          )
        : null;
  }

  @override
  Future<UserModel?> loginWithGoogle() async {
    await GoogleSignIn().signOut();

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      return null;
    }

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final userCredential = await _auth.signInWithCredential(credential);

    return UserModel.fromCredential(userCredential);
  }
}
