import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../domain/models/identity_card_model.dart';
import '../../domain/repositories/identity_card_repository.dart';

class IdentityCardRepositoryImpl implements IdentityCardRepository {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  IdentityCardRepositoryImpl(
    this._firestore,
    this._storage,
  );

  CollectionReference get ic => _firestore.collection('identity_cards');
  Reference get cardStorage => _storage.ref('identity_cards');

  @override
  Future<IdentityCardModel> create(
    IdentityCardModel card, {
    Uint8List? croppedImage,
    Uint8List? photoImage,
  }) async {
    final doc = ic.doc();

    final cardImageRef = cardStorage.child('${doc.id}/card.jpg');
    final photoRef = cardStorage.child('${doc.id}/photo.jpg');

    if (croppedImage != null) {
      await cardImageRef.putData(croppedImage);
      card = card.copyWith(cardImageUrl: await cardImageRef.getDownloadURL());
    }

    if (photoImage != null) {
      await photoRef.putData(photoImage);
      card = card.copyWith(cardPhotoUrl: await photoRef.getDownloadURL());
    }

    await doc.set(card.toDocument());

    return card.copyWith(
      id: doc.id,
      createdAt: DateTime.now(),
    );
  }

  @override
  Future<void> delete(IdentityCardModel card) async {
    await ic.doc(card.id).delete();

    try {
      if (card.cardImageUrl != null) {
        await _storage.refFromURL(card.cardImageUrl!).delete();
      }
      if (card.cardPhotoUrl != null) {
        await _storage.refFromURL(card.cardPhotoUrl!).delete();
      }
    } on Exception {
      // pass
    }
  }

  @override
  Future<IdentityCardModel?> get(String id) async {
    final snapshot = await ic.doc(id).get();

    return IdentityCardModel.fromSnapshot(snapshot);
  }

  @override
  Future<IdentityCardModel> update(
    IdentityCardModel card, {
    Uint8List? croppedImage,
    Uint8List? photoImage,
  }) async {
    final cardImageRef = cardStorage.child('${card.id}/card.jpg');
    final photoRef = cardStorage.child('${card.id}/photo.jpg');

    if (croppedImage != null) {
      await cardImageRef.putData(croppedImage);
      card = card.copyWith(cardImageUrl: await cardImageRef.getDownloadURL());
    }

    if (photoImage != null) {
      await photoRef.putData(photoImage);
      card = card.copyWith(cardPhotoUrl: await photoRef.getDownloadURL());
    }

    await ic.doc(card.id).update(card.toDocument());

    return card;
  }

  @override
  Future<List<IdentityCardModel>> getAll() async {
    final snapshot = await ic.orderBy('created_at', descending: true).get();

    return snapshot.docs
        .map((doc) => IdentityCardModel.fromSnapshot(doc))
        .toList();
  }
}
