import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/datasources/dio_provider.dart';
import '../../data/repositories/dss_repository_impl.dart';
import '../models/dss_result_model.dart';
import '../models/identity_card_model.dart';

part 'dss_repository.g.dart';

abstract class DssRepository {
  Future<List<DssResultModel>> calculateFuzzy(
    List<IdentityCardModel> cardList,
  );
}

@Riverpod(keepAlive: true)
DssRepositoryImpl dssRepository(DssRepositoryRef ref) {
  final dio = ref.watch(dioProvider);

  return DssRepositoryImpl(dio);
}
