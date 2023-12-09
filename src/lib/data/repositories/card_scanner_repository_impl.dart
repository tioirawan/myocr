import 'dart:io';

import '../../domain/models/card_scanner_result_model.dart';
import '../../domain/models/identity_card_model.dart';
import '../../domain/repositories/card_scanner_repository.dart';

class CardScannerRepositoryImpl implements CardScannerRepository {
  @override
  Future<CardScannerResultModel?> scan(File image) async {
    await Future.delayed(const Duration(seconds: 5));

    final card = IdentityCardModel(
      nik: '1234567890123456',
      name: 'John Doe',
      birthPlace: 'Jakarta',
      birthDate: DateTime(2010, 10, 10),
      gender: 'LAKI-LAKI',
      bloodType: 'O',
      streetAdress: 'Jl. Jalan',
      rtNumber: '001',
      rwNumber: '002',
      village: 'Kampung',
      subDistrict: 'Kecamatan',
      district: 'Kabupaten',
      religion: 'Islam',
      maritalStatus: 'Belum Kawin',
      job: 'Programmer',
      nationality: 'WNI',
      validUntil: '10-10-2020',
    );

    return CardScannerResultModel(
      croppedImage: image.readAsBytesSync(),
      photoImage: image.readAsBytesSync(),
      identityCard: card,
    );
  }
}
