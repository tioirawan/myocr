import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Tentang Kami',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Image.asset('Assets/images/logo.png', width: 120, height: 120), // Add this line to display the image
            const SizedBox(height: 20),
            const Text(
                'Selamat datang di myKTP, solusi unggul dalam pengenalan objek data Kartu Tanda Penduduk (KTP) secara cepat, akurat, dan aman. Kami berkomitmen untuk menyediakan alat yang inovatif untuk membantu Anda mengoptimalkan proses pengenalan dan pengambilan data dari KTP dengan mudah.',
                style: TextStyle(fontSize: 16), textAlign: TextAlign.justify),
            const SizedBox(height: 20),
            const Text('Misi Kami', 
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), textAlign: TextAlign.left,),
            const SizedBox(height: 20),
          ],
        ),
      ),      
    );
  }
}
