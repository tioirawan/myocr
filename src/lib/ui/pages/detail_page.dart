import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/identity_card_model.dart';
import '../widgets/custom_scaffold.dart';

final ktp = {
  'NIK': '0034132142123',
  'Nama': 'Vladimir Putin',
  'Tempat Lahir': 'Jakarta',
  'Tanggal Lahir': '20-04-1981',
  'Jenis Kelamin': 'Laki-laki',
  'Golongan Darah': 'O',
  'Alamat': 'Jl. Sudirman No. 123',
  'RT': '007',
  'RW': '008',
  'Kel/Desa': 'Gulag',
  'Kecamatan': 'Sukajan',
  'Agama': 'Islam',
  'Status Perkawinan': 'Belum Kawin',
  'Pekerjaan': 'Wiraswasta',
  'Kewarganegaraan': 'WNI',
  'Berlaku Hingga': 'Seumur Hidup',
};

class DetailPage extends ConsumerStatefulWidget {
  const DetailPage({super.key});

  @override
  ConsumerState<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends ConsumerState<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)!.settings.arguments as IdentityCardModel?;

    return CustomScaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppBar(
              centerTitle: true,
              scrolledUnderElevation: 0,
              title: Text(
                'KTP Anda',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const Divider(height: 0),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(24.0),
                shrinkWrap: true,
                children: [
                  _buildKtpImage(context, data?.cardImageUrl),
                  _buildScannedPicture(context, data?.cardPhotoUrl),
                  _infoTile('NIK', data?.nik),
                  _infoTile('Nama', data?.name),
                  _infoTile('Tempat Lahir', data?.birthPlace),
                  _infoTile('Tanggal Lahir', data?.birthDate.toString()),
                  _infoTile('Jenis Kelamin', data?.gender),
                  _infoTile('Golongan Darah', data?.bloodType),
                  _infoTile('Alamat', data?.streetAdress),
                  _infoTile('RT', data?.rtNumber),
                  _infoTile('RW', data?.rwNumber),
                  _infoTile('Kel/Desa', data?.village),
                  _infoTile('Kecamatan', data?.subDistrict),
                  _infoTile('Kab/Kot', data?.district),
                  _infoTile('Agama', data?.religion),
                  _infoTile('Status Perkawinan', data?.maritalStatus),
                  _infoTile('Pekerjaan', data?.job),
                  _infoTile('Kewarganegaraan', data?.nationality),
                  _infoTile('Berlaku Hingga', data?.validUntil),
                ],
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
                  Navigator.pushNamed(context, '/detail/edit');
                },
                child: const Text('Tambah Data CV'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoTile(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Expanded(
            child: Text(': ${value?.toUpperCase() ?? '-'}'),
          ),
        ],
      ),
    );
  }

  Widget _buildKtpImage(BuildContext context, String? url) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: AspectRatio(
        aspectRatio: 1.6,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: url != null
              ? Image.network(
                  url,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  'assets/images/dummyktp.png',
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }

  Widget _buildScannedPicture(BuildContext context, String? url) {
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
            width: 125,
            child: AspectRatio(
              aspectRatio: 3 / 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: url != null
                    ? Image.network(
                        url,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
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
