import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../providers/user_provider.dart';
import '../widgets/custom_scaffold.dart';

class EditProfilePage extends ConsumerStatefulWidget {
  const EditProfilePage({super.key});

  @override
  ConsumerState<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends ConsumerState<EditProfilePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController fullName, email, password, phone;

  late String? photoUrl;
  Uint8List? photoImage;

  bool isShowPassword = true;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    final user = ref.read(userNotifierProvider).value;

    fullName = TextEditingController(text: user?.name);
    email = TextEditingController(text: user?.email);
    password = TextEditingController();
    phone = TextEditingController(text: user?.phoneNumber);
    photoUrl = user?.photoUrl;
  }

  Future<void> _updatePhoto() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image != null) {
      final cropped = await ImageCropper().cropImage(
        sourcePath: image.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
        ],
      );
      final bytes =
          await (cropped != null ? cropped.readAsBytes() : image.readAsBytes());

      setState(() {
        photoImage = bytes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return CustomScaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppBar(
              centerTitle: true,
              scrolledUnderElevation: 0,
              title: Text(
                'Edit Profil',
                style: TextStyle(
                  color: colorScheme.onBackground,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                color: colorScheme.onBackground,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              toolbarHeight: 60.0,
            ),
            const Divider(
              height: 1,
              thickness: 1,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Stack(
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
                          child: photoImage != null
                              ? CircleAvatar(
                                  radius: 50,
                                  backgroundImage: MemoryImage(photoImage!),
                                )
                              : (photoUrl != null
                                  ? CircleAvatar(
                                      radius: 50,
                                      backgroundImage: NetworkImage(photoUrl!),
                                    )
                                  : const CircleAvatar(
                                      radius: 50,
                                      backgroundImage: AssetImage(
                                          'assets/images/profile.png'),
                                    )),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            width: 38,
                            child: FittedBox(
                              child: IconButton(
                                icon: const Icon(
                                  Icons.edit_rounded,
                                  color: Colors.white,
                                ),
                                onPressed: _updatePhoto,
                              ),
                            ),
                          ),
                        ),
                      ],
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
                      controller: fullName,
                      style: textTheme.bodyMedium,
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
                      controller: email,
                      style: textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onBackground
                            .withOpacity(0.5),
                      ),
                      readOnly: true,
                      enabled: false,
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
                      controller: password,
                      style: textTheme.bodyMedium,
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
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (value) {
                        if (value?.isNotEmpty == true && value!.length < 6) {
                          return 'Kata sandi minimal 6 karakter';
                        }

                        return null;
                      },
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
                      controller: phone,
                      style: textTheme.bodyMedium,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFE2E2E5).withOpacity(0.4),
                        hintText: 'Masukkan Nomor Telepon',
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
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 48),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                      onPressed: isLoading
                          ? null
                          : _onSave, // Tambahkan parameter onPressed
                      child: isLoading
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : Text(
                              'Simpan',
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onSave() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      final user = ref.read(userNotifierProvider).value;

      final updatedUser = user?.copyWith(
        name: fullName.text,
        email: email.text,
        phoneNumber: phone.text,
      );

      await ref.read(userNotifierProvider.notifier).updateProfile(
            updatedUser!,
            password: password.text.isEmpty ? null : password.text,
            photoImage: photoImage,
          );

      setState(() {
        isLoading = false;
      });

      if (context.mounted) {
        Navigator.pop(context);
      }
    }
  }

  @override
  void dispose() {
    fullName.dispose();
    email.dispose();
    password.dispose();
    phone.dispose();

    super.dispose();
  }
}
