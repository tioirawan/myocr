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
      body: Container(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('KTP Anda',
                  style: Theme.of(context).textTheme.headlineLarge),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: ktp.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(ktp.keys.elementAt(index)),
                      subtitle: Text(ktp.values.elementAt(index)),
                    );
                  },
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                  foregroundColor: Theme.of(context).colorScheme.onSecondary,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/scan');
                },
                child: const Text('Ubah'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
