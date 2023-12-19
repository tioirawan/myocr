import 'package:file_saver/file_saver.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/identity_card_model.dart';

part 'exporter_service.g.dart';

class ExporterService {
  Future<void> exportToPdf(IdentityCardModel card) async {
    try {
      Uint8List cardImageBytes =
          (await NetworkAssetBundle(Uri.parse(card.cardImageUrl!))
                  .load(card.cardImageUrl!))
              .buffer
              .asUint8List();
      Uint8List photoImageBytes =
          (await NetworkAssetBundle(Uri.parse(card.cardPhotoUrl!))
                  .load(card.cardPhotoUrl!))
              .buffer
              .asUint8List();

      final cardImage = pw.MemoryImage(cardImageBytes);
      final photoImage = pw.MemoryImage(photoImageBytes);

      final pdf = pw.Document();

      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) => pw.Center(
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Row(children: [
                  pw.Expanded(
                    flex: 2,
                    child: pw.Image(cardImage),
                  ),
                  pw.Expanded(
                    child: pw.Image(photoImage),
                  ),
                ]),
                pw.Divider(height: 38),
                pw.Row(children: [
                  pw.Expanded(
                      child: pw.Column(children: [
                    _detail('NIK', card.nik),
                    _detail('Nama', card.name),
                    _detail('Tempat Lahir', card.birthPlace),
                    _detail('Tanggal Lahir', card.birthDate.toString()),
                    _detail('Jenis Kelamin', card.gender),
                    _detail('Golongan Darah', card.bloodType),
                    _detail('Alamat', card.streetAdress),
                    _detail('RT', card.rtNumber),
                    _detail('RW', card.rwNumber),
                  ])),
                  pw.Expanded(
                      child: pw.Column(children: [
                    _detail('Kel/Desa', card.village),
                    _detail('Kecamatan', card.subDistrict),
                    _detail('Kab/Kot', card.district),
                    _detail('Agama', card.religion),
                    _detail('Status Perkawinan', card.maritalStatus),
                    _detail('Pekerjaan', card.job),
                    _detail('Kewarganegaraan', card.nationality),
                    _detail('Berlaku Hingga', card.validUntil),
                  ])),
                ])
              ],
            ),
          ),
        ),
      );

      await FileSaver.instance.saveAs(
        name: '${card.nik}_${DateTime.now().millisecondsSinceEpoch}.pdf',
        bytes: await pdf.save(),
        ext: 'pdf',
        mimeType: MimeType.pdf,
      );
    } catch (e) {
      // print(e);
    }
  }

  pw.Widget _detail(String title, String? value) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 2),
      child: pw.Row(
        children: [
          pw.Text(
            title,
            style: pw.TextStyle(
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.SizedBox(width: 8),
          pw.Text(value ?? '-'),
        ],
      ),
    );
  }
}

@riverpod
ExporterService exporterService(ExporterServiceRef ref) {
  return ExporterService();
}
