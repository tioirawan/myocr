import 'dart:typed_data';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/models/identity_card_model.dart';
import '../../domain/repositories/identity_card_repository.dart';
import 'user_provider.dart';

part 'identity_card_provider.g.dart';

@Riverpod(keepAlive: true)
class IdentityCardNotifier extends _$IdentityCardNotifier {
  @override
  FutureOr<List<IdentityCardModel>> build() {
    final user = ref.watch(userNotifierProvider);
    final repository = ref.watch(identityCardRepositoryProvider);

    if (user.value?.id == null) {
      return [];
    }

    return repository.getAll(user.value!.id!);
  }

  IdentityCardRepository get _repository =>
      ref.read(identityCardRepositoryProvider);

  String? get _userId =>
      ref.read(userNotifierProvider.select((state) => state.value?.id));

  Future<void> refresh() async {
    if (_userId == null) {
      state = const AsyncValue.data([]);
      return;
    }

    final result = await _repository.getAll(_userId!);

    state = AsyncValue.data(result);
  }

  Future<void> save(
    IdentityCardModel card, {
    Uint8List? croppedImage,
    Uint8List? photoImage,
  }) async {
    if (_userId == null) {
      state = const AsyncValue.data([]);
      return;
    }
    if (card.id == null) {
      final result = await _repository.create(
        _userId!,
        card,
        croppedImage: croppedImage,
        photoImage: photoImage,
      );

      state = AsyncValue.data([result, ...?state.value]);
    } else {
      final result = await _repository.update(
        _userId!,
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
    if (_userId == null) {
      state = const AsyncValue.data([]);
      return;
    }

    state = AsyncValue.data([
      for (final item in state.value ?? [])
        if (item.id != card.id) item
    ]);

    await _repository.delete(_userId!, card);
  }
}

@riverpod
IdentityCardModel? identityCard(IdentityCardRef ref, String? id) {
  final cards = ref.watch(identityCardNotifierProvider);

  if (id == null || cards.value == null) {
    return null;
  }

  IdentityCardModel? card;

  for (final item in cards.value!) {
    if (item.id == id) {
      card = item;
      break;
    }
  }

  return card;
}
