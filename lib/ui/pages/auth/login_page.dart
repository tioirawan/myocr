import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isShowPassword = false;
  bool isAgree = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Masuk',
                style: textTheme.headlineLarge!.apply(fontWeightDelta: 2),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text('Masuk untuk dapat menggunakan akun myKTP kamu yuk!'),
              const SizedBox(
                height: 32,
              ),
              Text(
                'Alamat Email',
                style: textTheme.labelLarge!.apply(fontWeightDelta: 2),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFE2E2E5).withOpacity(0.4),
                    hintText: 'Masukkan Alamat Email',
                    hintStyle: textTheme.bodySmall,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none)),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Kata Sandi',
                style: textTheme.labelLarge!.apply(fontWeightDelta: 2),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                obscureText: isShowPassword,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFE2E2E5).withOpacity(0.4),
                    hintText: 'Masukkan Kata Sandi',
                    hintStyle: textTheme.bodySmall,
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isShowPassword = !isShowPassword;
                          });
                        },
                        icon: isShowPassword
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none)),
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 48),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/scan');
                    },
                    child: Text(
                      'Masuk',
                      style: Theme.of(context).textTheme.labelLarge!.apply(
                            fontWeightDelta: 2,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 28),
                    height: 1, // Atur tinggi garis sesuai dengan kebutuhan Anda
                    color: Colors.grey
                        .withOpacity(0.40), // Warna garis yang Anda inginkan
                    width: 250, // Atur lebar garis sesuai dengan kebutuhan Anda
                  ),
                  const SizedBox(
                      height:
                          18), // Jarak antara garis dan teks "Atau daftar dengan"
                  Text(
                    'Atau masuk menggunakan',
                    style: Theme.of(context).textTheme.bodySmall!.apply(
                          decoration:
                              TextDecoration.underline, // Efek underline
                        ),
                  ),
                  const SizedBox(
                      height: 18), // Jarak antara teks dan logo Google
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color:
                              Colors.grey.withOpacity(0.25), // Warna bayangan
                          blurRadius: 8, // Besarnya blur
                          spreadRadius: 1, // Besarnya penyebaran
                        ),
                      ],
                    ),
                    child: Center(
                      child: Image.network(
                        'https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png',
                        width: 30, // Lebar gambar
                        height: 30, // Tinggi gambar
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
