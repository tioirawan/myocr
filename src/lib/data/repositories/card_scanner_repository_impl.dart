import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../domain/models/card_scanner_result_model.dart';
import '../../domain/models/identity_card_model.dart';
import '../../domain/repositories/card_scanner_repository.dart';

class CardScannerRepositoryImpl implements CardScannerRepository {
  final Dio _dio;

  CardScannerRepositoryImpl(this._dio);

  @override
  Future<CardScannerResultModel?> scan(File image) async {
    final FormData form = FormData.fromMap({
      'image': await MultipartFile.fromFile(image.path),
    });

    final response = await _dio.post('/scan', data: form);
    final data = response.data;

    final cardImageBase64 = data['card_image'];
    final photoImageBase64 = data['photo_image'];

    final cardImage = base64Decode(cardImageBase64);
    final photoImage = base64Decode(photoImageBase64);

    final Map<String, dynamic> cardData = data['card_data'];

    final List birthDateString = cardData['tanggal_lahir']?.split('-') ?? [];

    final birthDate = birthDateString.isNotEmpty
        ? DateTime(
            int.tryParse(birthDateString[2]) ?? 0,
            int.tryParse(birthDateString[1]) ?? 0,
            int.tryParse(birthDateString[0]) ?? 0,
          )
        : null;

    final card = IdentityCardModel(
      nik: cardData['nik'],
      name: cardData['nama'],
      birthPlace: cardData['tempat_lahir'],
      birthDate: birthDate,
      gender: cardData['jenis_kelamin'],
      bloodType: cardData['golongan_darah'],
      streetAdress: cardData['alamat'],
      rtNumber: cardData['rt'],
      rwNumber: cardData['rw'],
      village: cardData['kelurahan'],
      subDistrict: cardData['kecamatan'],
      district: cardData['kabupaten'],
      religion: cardData['agama'],
      maritalStatus: cardData['status_perkawinan'],
      job: cardData['pekerjaan'],
      nationality: cardData['kewarganegaraan'],
      validUntil: cardData['berlaku_hingga'],
    );

    return CardScannerResultModel(
      croppedImage: cardImage,
      photoImage: photoImage,
      identityCard: card,
    );
  }
}
