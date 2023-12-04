import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/models/identity_card_model.dart';
import '../../domain/repositories/identity_card_repository.dart';

class IdentityCardRepositoryImpl implements IdentityCardRepository {
  final db = FirebaseFirestore.instance;

  @override
  Future<void> create(IdentityCardModel card) async {
    await db.collection('identity_cards').add(card.toJson()).then(
          (doc) => print("Add Document with id ${doc.id}"),
          onError: (e) => print("Error adding document $e"),
        );
  }

  @override
  Future<void> delete(IdentityCardModel card) async {
    await db.collection('identity_cards').doc(card.id).delete().then(
          (doc) => print("Document deleted"),
          onError: (e) => print("Error updating document $e"),
        );
  }

  @override
  Future<IdentityCardModel?> get(String id) async {
    await db.collection('identity_cards').doc(id).get().then(
      (DocumentSnapshot doc) {
        return doc.data() as Future<List<IdentityCardModel>>;
      },
      onError: (e) => print("Error getting document: $e"),
    );
    return null;
  }

  @override
  Future<void> update(IdentityCardModel card) async {
    await db
        .collection('identity_cards')
        .doc(card.id)
        .update(card.toJson())
        .then((value) => print("DocumentSnapshot successfully updated!"),
            onError: (e) => print("Error updating document $e"));
  }

  @override
  Future<List<IdentityCardModel>> getAll() async {
    await db.collection('identity_cards').get().then(
      (QuerySnapshot docs) {
        return docs as Future<List<IdentityCardModel>>;
      },
      onError: (e) => print("Error getting document: $e"),
    );
    return [];
  }
}
