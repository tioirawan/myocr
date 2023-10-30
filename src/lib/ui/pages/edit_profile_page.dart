import 'package:flutter/material.dart';

import '../widgets/custom_scaffold.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool isShowPassword = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return CustomScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppBar(
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            centerTitle: true,
            scrolledUnderElevation: 0,
            title: const Text(
              'Edit Profil',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.black,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            toolbarHeight: 60.0,
          ),
          const Divider(
            // Tambahkan Divider di sini
            height: 1,
            thickness: 1,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 4.0,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                        radius: 40,
                        backgroundImage:
                            AssetImage('assets/images/profile.png')),
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Nama Lengkap',
                      style: textTheme.labelLarge!.apply(fontWeightDelta: 2),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFE2E2E5).withOpacity(0.4),
                        hintText: 'Vladimir Putin',
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
                    height: 16,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Alamat Email',
                      style: textTheme.labelLarge!.apply(fontWeightDelta: 2),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFE2E2E5).withOpacity(0.4),
                        hintText: 'vladimirputin@gmail.com',
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
                    height: 16,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Kata Sandi',
                      style: textTheme.labelLarge!.apply(fontWeightDelta: 2),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    obscureText: isShowPassword,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFE2E2E5).withOpacity(0.4),
                        hintText: 'putin123ituputin456',
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
                  const SizedBox(
                    height: 16,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Nomor Telepon',
                      style: textTheme.labelLarge!.apply(fontWeightDelta: 2),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFE2E2E5).withOpacity(0.4),
                        hintText: '083848492377',
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
                    height: 40,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 48),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    onPressed: () {
                      Navigator.popAndPushNamed(context, '/profile');
                    },
                    child: Text(
                      'Simpan',
                      style: Theme.of(context).textTheme.labelLarge!.apply(
                            fontWeightDelta: 2,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
