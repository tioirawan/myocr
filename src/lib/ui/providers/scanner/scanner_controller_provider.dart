import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/repositories/card_scanner_repository.dart';
import '../../pages/ocr_method_page.dart';
import 'scanner_state.dart';

part 'scanner_controller_provider.g.dart';

@Riverpod(keepAlive: true)
class ScannerController extends _$ScannerController {
  ScannerController();

  @override
  ScannerState build() => const ScannerStateNoImage();

  CardScannerRepository _scanner(OCRMethod method) =>
      ref.read(cardScannerRepositoryProvider(method));

  Future<void> scan(File image, OCRMethod method) async {
    if (image.path.isEmpty) {
      state = ScannerStateError(error: 'Image is empty', image: image);
      return;
    }

    state = ScannerStateScanning(image: image);

    try {
      final result = await _scanner(method).scan(image);

      if (result != null) {
        state = ScannerStateSuccess(
          result: result,
          image: image,
        );
      } else {
        state = ScannerStateError(
          error: 'Failed to scan',
          image: image,
        );
      }
    } on Exception catch (e, _) {
      state = ScannerStateError(
        error: e.toString().replaceAll('Exception: ', ''),
        image: image,
      );
    }
  }
}
