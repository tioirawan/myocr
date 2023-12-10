import 'dart:typed_data';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/models/identity_card_model.dart';
import '../../domain/repositories/identity_card_repository.dart';

part 'identity_card_provider.g.dart';

@riverpod
class IdentityCardNotifier extends _$IdentityCardNotifier {
  @override
  FutureOr<List<IdentityCardModel>> build() {
    final repository = ref.watch(identityCardRepositoryProvider);

    return repository.getAll();
  }

  IdentityCardRepository get _repository =>
      ref.read(identityCardRepositoryProvider);

  Future<void> refresh() async {
    final result = await _repository.getAll();

    state = AsyncValue.data(result);
  }

  Future<void> save(
    IdentityCardModel card, {
    Uint8List? croppedImage,
    Uint8List? photoImage,
  }) async {
    if (card.id == null) {
      final result = await _repository.create(
        card,
        croppedImage: croppedImage,
        photoImage: photoImage,
      );

      state = AsyncValue.data([result, ...?state.value]);
    } else {
      final result = await _repository.update(
        card,
        croppedImage: croppedImage,
        photoImage: photoImage,
      );

      state = AsyncValue.data([
        for (final item in state.value ?? [])
          if (item.id == card.id) result else item
      ]);
    }
  }

  Future<void> delete(IdentityCardModel card) async {
    await _repository.delete(card);

    state = AsyncValue.data([
      for (final item in state.value ?? [])
        if (item.id != card.id) item
    ]);
  }
}
