import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../../domain/models/card_scanner_result_model.dart';
import '../../../domain/models/identity_card_model.dart';
import '../../../domain/repositories/card_scanner_repository.dart';

class TesseractCardScannerRepositoryImpl implements CardScannerRepository {
  final Dio _dio;

  TesseractCardScannerRepositoryImpl(this._dio);

  @override
  Future<CardScannerResultModel?> scan(File image) async {
    final FormData form = FormData.fromMap({
      'ktp_image': await MultipartFile.fromFile(image.path),
    });

    final response = await _dio.post('/recognize/ktp/tesseract', data: form);
    final data = response.data;

    final Map<String, dynamic> cardData = data['data'];

    final cardImageBase64 = cardData['ktp_img'];
    final photoImageBase64 = cardData['face_img'];

    final cardImage =
        cardImageBase64 != null ? base64Decode(cardImageBase64) : null;
    final photoImage =
        photoImageBase64 != null ? base64Decode(photoImageBase64) : null;

    // final List birthDateString = cardData['tanggal_lahir']?.split('-') ?? [];

    // final birthDate = birthDateString.isNotEmpty
    //     ? DateTime(
    //         int.tryParse(birthDateString[2]) ?? 0,
    //         int.tryParse(birthDateString[1]) ?? 0,
    //         int.tryParse(birthDateString[0]) ?? 0,
    //       )
    //     : null;

    final card = IdentityCardModel.fromJson(cardData);

    // final card = IdentityCardModel(
    //   nik: cardData['nik'],
    //   name: cardData['nama'],
    //   birthPlace: cardData['tempat_lahir'],
    //   birthDate: birthDate,
    //   gender: cardData['jenis_kelamin'],
    //   bloodType: cardData['golongan_darah'],
    //   streetAdress: cardData['alamat'],
    //   rtNumber: cardData['rt'],
    //   rwNumber: cardData['rw'],
    //   village: cardData['kelurahan'],
    //   subDistrict: cardData['kecamatan'],
    //   district: cardData['kabupaten'],
    //   religion: cardData['agama'],
    //   maritalStatus: cardData['status_perkawinan'],
    //   job: cardData['pekerjaan'],
    //   nationality: cardData['kewarganegaraan'],
    //   validUntil: cardData['berlaku_hingga'],
    // );

    return CardScannerResultModel(
      croppedImage: cardImage,
      photoImage: photoImage,
      identityCard: card,
    );
  }
}
