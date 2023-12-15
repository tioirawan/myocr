import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/datasources/dio_provider.dart';
import '../../data/repositories/card_scanner/myktp_card_scanner_repository_impl.dart';
import '../../data/repositories/card_scanner/tesseract_card_scanner_repository_impl.dart';
import '../../ui/pages/ocr_method_page.dart';
import '../models/card_scanner_result_model.dart';

part 'card_scanner_repository.g.dart';

abstract class CardScannerRepository {
  Future<CardScannerResultModel?> scan(File image);
}

@riverpod
CardScannerRepository cardScannerRepository(
  CardScannerRepositoryRef ref,
  OCRMethod method,
) {
  final dio = ref.watch(dioProvider);

  return switch (method) {
    OCRMethod.tesseract => TesseractCardScannerRepositoryImpl(dio),
    OCRMethod.myktp => MyKTPCardScannerRepositoryImpl(dio),
    OCRMethod.google => MyKTPCardScannerRepositoryImpl(dio),
  };
}
