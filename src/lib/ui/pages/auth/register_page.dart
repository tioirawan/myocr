import 'package:flutter/material.dart';

import '../../widgets/custom_scaffold.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isShowPassword = false;
  bool isAgree = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return CustomScaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 64),
              Text(
                'Daftar Sekarang',
                style: textTheme.headlineLarge!.apply(fontWeightDelta: 2),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                  'Sebelum kamu masuk ke aplikasi myKTP buat akun dulu yuk!'),
              const SizedBox(
                height: 32,
              ),
              Text(
                'Nama Lengkap',
                style: textTheme.labelLarge!.apply(fontWeightDelta: 2),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFE2E2E5).withOpacity(0.4),
                    hintText: 'Masukkan Nama Lengkap',
                    hintStyle: textTheme.bodySmall,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .colorScheme
                            .primary, // Warna outline saat difokuskan
                        width: 2.0, // Lebar outline saat difokuskan
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none)),
              ),
              const SizedBox(
                height: 24,
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
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context)
                          .colorScheme
                          .primary, // Warna outline saat difokuskan
                      width: 2.0, // Lebar outline saat difokuskan
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
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
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .colorScheme
                            .primary, // Warna outline saat difokuskan
                        width: 2.0, // Lebar outline saat difokuskan
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none)),
              ),
              CheckboxListTile(
                contentPadding: const EdgeInsets.all(
                    0), // Removes padding around the CheckboxListTile
                title: Text(
                  'Saya menyetujui kebijakan privasi dan ketentuan layanan myKTP',
                  style: textTheme.bodySmall,
                ),
                value:
                    isAgree, // You need to define isAgree as a bool variable.
                onChanged: (value) {
                  setState(() {
                    isAgree = value!;
                  });
                },
                controlAffinity: ListTileControlAffinity
                    .leading, // Places the checkbox on the left.
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
                      Navigator.popAndPushNamed(context, '/login');
                    },
                    child: Text(
                      'Daftar',
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
                    'Atau mendaftar menggunakan',
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
