import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/models/user_model.dart';
import '../../providers/user_provider.dart';
import '../../widgets/custom_scaffold.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isShowPassword = true;
  bool isAgree = false;
  bool isLoading = false;
  bool isGoogleLoading = false;

  void _listenUser(_, AsyncValue<UserModel?> state) {
    state.when(
      data: (user) {
        if (user != null) {
          Navigator.of(context).pushReplacementNamed('/dashboard');
        }
      },
      error: (e, st) {
        String message;

        if (e is FirebaseException) {
          message = switch (e.code) {
            'invalid-credential' => 'Email atau kata sandi salah',
            _ => e.message ?? e.code,
          };
        } else {
          message = e.toString();
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
          ),
        );
      },
      loading: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    ref.listen(userNotifierProvider, _listenUser);

    return CustomScaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
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
                  controller: _usernameController,
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
                        borderSide: BorderSide.none),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama lengkap tidak boleh kosong';
                    }
                    return null;
                  },
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
                  controller: _emailController,
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Alamat email tidak boleh kosong';
                    }
                    return null;
                  },
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
                  controller: _passwordController,
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
                        borderSide: BorderSide.none),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Kata sandi tidak boleh kosong';
                    }
                    return null;
                  },
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
                      onPressed: isLoading ? null : _register,
                      child: isLoading
                          ? const CircularProgressIndicator()
                          : Text(
                              'Daftar',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .apply(
                                    fontWeightDelta: 2,
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                  ),
                            ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 28),
                      height:
                          1, // Atur tinggi garis sesuai dengan kebutuhan Anda
                      color: Colors.grey
                          .withOpacity(0.40), // Warna garis yang Anda inginkan
                      width:
                          250, // Atur lebar garis sesuai dengan kebutuhan Anda
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
                      child: Material(
                        shape: const CircleBorder(),
                        color: Colors.white,
                        child: InkWell(
                          customBorder: const CircleBorder(),
                          onTap: () async {
                            setState(() {
                              isGoogleLoading = true;
                            });
                            await ref
                                .read(userNotifierProvider.notifier)
                                .loginWithGoogle();
                            setState(() {
                              isGoogleLoading = false;
                            });
                          },
                          child: Center(
                            child: isGoogleLoading
                                ? const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: CircularProgressIndicator(),
                                  )
                                : Image.network(
                                    'https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png',
                                    width: 30, // Lebar gambar
                                    height: 30, // Tinggi gambar
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (!isAgree) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Anda harus menyetujui kebijakan privasi dan ketentuan layanan myKTP'),
        ),
      );

      return;
    }

    setState(() {
      isLoading = true;
    });

    final notifier = ref.read(userNotifierProvider.notifier);

    await notifier.register(
      _usernameController.text,
      _emailController.text,
      _passwordController.text,
    );

    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
