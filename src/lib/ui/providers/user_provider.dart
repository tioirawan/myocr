import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/models/identity_card_model.dart';
import '../../domain/repositories/identity_card_repository.dart';

part 'identity_card_provider.g.dart';

@riverpod
class IdentityCardNotifier extends _$IdentityCardNotifier {
  @override
  List<IdentityCardModel> build() => [];

  IdentityCardRepository get _repository =>
      ref.read(identityCardRepositoryProvider);

  Future<void> save(IdentityCardModel card) async {
    if (card.id == null) {
      await _repository.create(card);

      state = [...state, card];
    } else {
      await _repository.update(card);

      state = [
        for (final item in state)
          if (item.id == card.id) card else item
      ];
    }
  }

  Future<void> delete(IdentityCardModel card) async {
    await _repository.delete(card);

    state = [
      for (final item in state)
        if (item.id != card.id) item
    ];
  }
}