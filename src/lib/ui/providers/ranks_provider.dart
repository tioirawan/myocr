import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/models/dss_result_model.dart';
import '../../domain/repositories/dss_repository.dart';
import 'identity_card_provider.dart';

part 'ranks_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<DssResultModel>> ranks(RanksRef ref) {
  final cardList = ref.watch(identityCardNotifierProvider);
  final repository = ref.watch(dssRepositoryProvider);

  return repository.calculateFuzzy(cardList.value ?? []);
}
