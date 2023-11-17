import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/models/identity_card_model.dart';

part 'identity_card_provider.g.dart';

@riverpod
class IdentityCardNotifier extends _$IdentityCardNotifier {
  @override
  Stream<List<IdentityCardModel>> build() => Stream.value([]);

  Future<void> save(IdentityCardModel card) async {
    // TODO: implement save
  }

  Future<void> delete(IdentityCardModel card) async {
    // TODO: implement delete
  }
}
