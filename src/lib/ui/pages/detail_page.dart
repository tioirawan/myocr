import 'package:flutter/material.dart';

import '../widgets/custom_scaffold.dart';

final ktp = {
  'NIK': '1234567890123456',
  'Nama': 'John Doe',
  'Tempat Lahir': 'Jakarta',
  'Tanggal Lahir': '01-01-1990',
  'Jenis Kelamin': 'Laki-laki',
  'Alamat': 'Jl. Sudirman No. 123',
  'RT': '001',
  'RW': '002',
  'Kelurahan': 'Kebayoran Baru',
  'Kecamatan': 'Jakarta Selatan',
  'Agama': 'Islam',
  'Status Perkawinan': 'Belum Kawin',
  'Pekerjaan': 'PNS',
  'Kewarganegaraan': 'WNI',
};

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(24.0),
              child: Text('KTP Anda',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const Divider(height: 0),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(24.0),
                itemCount: ktp.length + 2,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return _buildKtpImage(context);
                  } else if (index == 1) {
                    return _buildScannedPicture(context);
                  }

                  index -= 2;

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                          ktp.keys.elementAt(index),
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        )),
                        Expanded(
                            child: Text(' : ${ktp.values.elementAt(index)}')),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                  foregroundColor: Theme.of(context).colorScheme.onSecondary,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/scan/result');
                },
                child: const Text('Ubah'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKtpImage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: AspectRatio(
        aspectRatio: 1.6,
        child: Image.asset(
          'assets/images/dummyktp.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildScannedPicture(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Foto',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: 100,
            child: AspectRatio(
              aspectRatio: 3 / 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/profile.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
