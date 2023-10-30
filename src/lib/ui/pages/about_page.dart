import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Tentang Kami'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 180,
              height: 180,
            ),
            const SizedBox(height: 20),
            const Text(
                'Selamat datang di myKTP, solusi unggul dalam pengenalan objek data Kartu Tanda Penduduk (KTP) secara cepat, akurat, dan aman. Kami berkomitmen untuk menyediakan alat yang inovatif untuk membantu Anda mengoptimalkan proses pengenalan dan pengambilan data dari KTP dengan mudah.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.justify),
            const SizedBox(height: 20),
            const Text('Misi Kami',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left),
            const SizedBox(height: 20),
            const Text(
                'Misi utama myKTP adalah menyederhanakan dan mempercepat pengenalan data KTP, memberikan solusi yang efisien dan dapat diandalkan bagi individu, bisnis, serta lembaga pemerintah. Kami bertujuan untuk mengurangi beban pekerjaan manual, menghindari kesalahan manusia, dan meningkatkan efisiensi dalam proses identifikasi dan verifikasi identitas.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.justify),
            const SizedBox(height: 20),
            const Text('Tim Kami',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left),
            const SizedBox(height: 20),
            const Text(
                'Di balik myKTP, ada tim berpengalaman dan berkomitmen yang bekerja keras untuk menjadikan pengenalan objek data KTP lebih baik. Berikut tim kami:',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.justify),
            const SizedBox(height: 20),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('1. Adam Rafi Rezandi',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left),
                Text('2. Andi Dwi Prastyo',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left),
                Text('3. Bima Bayu Saputra',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left),
                Text('4. Lailatul Badriyah',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left),
                Text('5. Tio Misbaqul Irawan',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left),
              ],
            )
          ],
        ),
      ),
    );
  }
}
