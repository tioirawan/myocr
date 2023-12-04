import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/models/identity_card_model.dart';
import '../../domain/repositories/identity_card_repository.dart';

class IdentityCardRepositoryImpl implements IdentityCardRepository {
  final db = FirebaseFirestore.instance;
  IdentityCardModel ic = IdentityCardModel.fromJson({
    'id': '1',
    'cardImageUrl': 'https://i.ibb.co/0jZQYQg/ktp.png',
    'cardPhotoUrl': 'https://i.ibb.co/0jZQYQg/ktp.png',
    'nik': '0034132142123',
    'name': 'Vladimir Putin',
    'birthPlace': 'Jakarta',
    'birthDate': '20-04-1981',
    'gender': 'Laki-laki',
    'bloodType': 'O',
    'streetAddress': 'Jl. Sudirman No. 123',
    'rtNumber': '007',
    'rwNumber': '008',
    'village': 'Gulag',
    'subDistrict': 'Sukajan',
    'district': 'Jakarta Pusat',
    'religion': 'Islam',
    'maritalStatus': 'Belum Kawin',
    'job': 'Wiraswasta',
    'nationality': 'WNI',
    'vallidUntil': 'Seumur Hidup',
  });
  @override
  Future<void> create(IdentityCardModel card) async {
    return await db.collection('identity_cards').add(card.toJson()).then(
          (doc) => print("Add Document with id ${doc.id}"),
          onError: (e) => print("Error adding document $e"),
        );
  }

  @override
  Future<void> delete(IdentityCardModel card) async {
    return await db.collection('identity_cards').doc(card.id).delete().then(
          (doc) => print("Document deleted"),
          onError: (e) => print("Error updating document $e"),
        );
  }

  @override
  Future<IdentityCardModel?> get(String id) async {
    return await db.collection('identity_cards').doc(id).get().then(
      (DocumentSnapshot doc) {
        return ic as Future<IdentityCardModel>;
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }

  @override
  Future<void> update(IdentityCardModel card) async {
    return await db
        .collection('identity_cards')
        .doc(card.id)
        .update(card.toJson())
        .then((value) => print("DocumentSnapshot successfully updated!"),
            onError: (e) => print("Error updating document $e"));
  }

  @override
  Future<List<IdentityCardModel>> getAll() async {
    return await db.collection('identity_cards').get().then(
      (QuerySnapshot docs) {
        return docs as Future<List<IdentityCardModel>>;
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }
}
