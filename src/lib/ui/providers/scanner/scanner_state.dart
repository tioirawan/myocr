import 'dart:io';

import '../../../domain/models/card_scanner_result_model.dart';

sealed class ScannerState {
  const ScannerState({this.result, this.image});

  final CardScannerResultModel? result;
  final File? image;
}

class ScannerStateNoImage extends ScannerState {
  const ScannerStateNoImage() : super();
}

class ScannerStateScanning extends ScannerState {
  const ScannerStateScanning({required super.image});
}

class ScannerStateSuccess extends ScannerState {
  const ScannerStateSuccess({
    required super.result,
    required super.image,
  });
}

class ScannerStateError extends ScannerState {
  const ScannerStateError({
    required this.error,
    required super.image,
  }) : super();

  final String error;
}
