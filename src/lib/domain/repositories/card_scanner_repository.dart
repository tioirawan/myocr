import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/card_scanner_repository_impl.dart';
import '../models/card_scanner_result_model.dart';

part 'card_scanner_repository.g.dart';

abstract class CardScannerRepository {
  Future<CardScannerResultModel?> scan(File image);
}

@riverpod
CardScannerRepository cardScannerRepository(CardScannerRepositoryRef ref) {
  return CardScannerRepositoryImpl();
}
