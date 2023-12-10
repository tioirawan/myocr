import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/identity_card_repository_impl.dart';
import '../models/identity_card_model.dart';
import '../services/firebase_services.dart';

part 'identity_card_repository.g.dart';

abstract class IdentityCardRepository {
  Future<IdentityCardModel> create(
    IdentityCardModel card, {
    Uint8List? croppedImage,
    Uint8List? photoImage,
  });
  Future<IdentityCardModel> update(
    IdentityCardModel card, {
    Uint8List? croppedImage,
    Uint8List? photoImage,
  });
  Future<void> delete(IdentityCardModel card);
  Future<IdentityCardModel?> get(String id);
  Future<List<IdentityCardModel>> getAll();
}

@riverpod
IdentityCardRepository identityCardRepository(IdentityCardRepositoryRef ref) {
  final firestore = ref.watch(firebaseFirestoreProvider);
  final storage = ref.watch(firebaseStorageProvider);

  return IdentityCardRepositoryImpl(
    firestore,
    storage,
  );
}
