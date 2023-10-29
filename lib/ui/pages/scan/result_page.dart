import 'package:flutter/material.dart';

import '../../widgets/custom_scaffold.dart';

Map<String, String> ktp = {
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

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Container(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Hasil Pindai KTP',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: ktp.length + 2,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return _buildKtpImage(context);
                      } else if (index == 1) {
                        return _buildScannedPicture(context);
                      }

                      index -= 2;
                      return ResultFormField(
                        title: ktp.keys.elementAt(index),
                        value: ktp.values.elementAt(index),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 48),
                    foregroundColor: Theme.of(context).colorScheme.onSecondary,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/detail');
                  },
                  child: const Text('Simpan'),
                ),
              ],
            ),
          ),
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
          const Text('Foto'),
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
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class ResultFormField extends StatefulWidget {
  const ResultFormField({required this.title, required this.value, super.key});
  final String title;
  final String value;
  @override
  _ResultFormFieldState createState() => _ResultFormFieldState();
}

class _ResultFormFieldState extends State<ResultFormField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title),
          const SizedBox(height: 8),
          TextFormField(
            controller: _controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Color(0xFFE2E2E5),
            ),
            onChanged: (value) {
              setState(() {
                _controller.text = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
