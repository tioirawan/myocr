import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../domain/models/user_model.dart';
import '../../domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  CollectionReference get _users => _firestore.collection('users');
  Reference get photoRef => _storage.ref('profile_photos');

  UserRepositoryImpl(
    this._auth,
    this._firestore,
    this._storage,
  );

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

    return UserModel.fromFirebaseUser(credential.user!).copyWith(
      name: username,
    );
  }

  @override
  Future<UserModel?> login(
    String email,
    String password,
  ) async {
    await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return currentUser();
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
    final user = _auth.currentUser != null
        ? UserModel.fromFirebaseUser(_auth.currentUser!)
        : null;

    if (user == null) {
      return null;
    }

    final snapshot = await _users.doc(user.id).get();

    if (snapshot.exists) {
      return user.copyWith(
        phoneNumber: snapshot.get('phone_number'),
      );
    }

    return user;
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

    return UserModel.fromFirebaseUser(userCredential.user!);
  }

  @override
  Future<UserModel?> updateProfile(
    UserModel user, {
    String? password,
    Uint8List? photoImage,
  }) async {
    final authUser = _auth.currentUser;

    if (authUser == null) {
      return null;
    }

    final futures = <Future>[];

    futures.add(authUser.updateDisplayName(user.name));
    futures.add(authUser.updateEmail(user.email!));

    futures.add(_users.doc(user.id).set({
      'phone_number': user.phoneNumber,
    }));

    if (password != null) {
      futures.add(authUser.updatePassword(password));
    }

    if (photoImage != null) {
      final ref = photoRef.child('${authUser.uid}.jpg');

      await ref.putData(photoImage);

      final url = await ref.getDownloadURL();

      futures.add(authUser.updatePhotoURL(url));

      user = user.copyWith(photoUrl: url);
    }

    await Future.wait(futures);

    return user;
  }
}
