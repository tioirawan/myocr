import '../../domain/models/identity_card_model.dart';
import '../../domain/repositories/identity_card_repository.dart';

class IdentityCardRepositoryImpl implements IdentityCardRepository {
  @override
  Future<void> create(IdentityCardModel card) async {
    return;
  }

  @override
  Future<void> delete(IdentityCardModel card) async {
    return;
  }

  @override
  Future<IdentityCardModel?> get(String id) async {
    return null;
  }

  @override
  Future<void> update(IdentityCardModel card) async {
    return;
  }

  @override
  Future<List<IdentityCardModel>> getAll() async {
    return [];
  }
}