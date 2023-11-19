import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/identity_card_repository_impl.dart';
import '../models/identity_card_model.dart';

part 'identity_card_repository.g.dart';

abstract class IdentityCardRepository {
  Future<void> create(IdentityCardModel card);
  Future<void> update(IdentityCardModel card);
  Future<void> delete(IdentityCardModel card);
  Future<IdentityCardModel?> get(String id);
  Future<List<IdentityCardModel>> getAll();
}

@riverpod
IdentityCardRepository identityCardRepository(IdentityCardRepositoryRef ref) {
  return IdentityCardRepositoryImpl();
}
