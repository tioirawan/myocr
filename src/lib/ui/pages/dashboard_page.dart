import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/models/identity_card_model.dart';
import '../providers/identity_card_provider.dart';
import '../providers/scanner/scanner_controller_provider.dart';
import '../providers/scanner/scanner_state.dart';
import '../providers/user_provider.dart';
import '../widgets/identity_card_tile.dart';

const Map<String, String> userData = {
  'name': 'Putin',
  'profileImage': 'assets/images/profile.png',
};

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  ConsumerState<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  Future getImage(BuildContext context) async {
    final colorScheme = Theme.of(context).colorScheme;

    final ImagePicker picker = ImagePicker();
    final ImageCropper cropper = ImageCropper();

    // Meminta izin penyimpanan sebelum mengambil gambar
    // var status = await Permission.storage.request();
    // if (status != PermissionStatus.granted) {
    //   print('Izin tidak diberikan untuk mengakses penyimpanan.');
    //   return;
    // }

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;

    // crop image
    final CroppedFile? croppedImage = await cropper.cropImage(
      sourcePath: image.path,
      aspectRatio: const CropAspectRatio(ratioX: 85.6, ratioY: 53.98),
      compressQuality: 100,
      maxWidth: 700,
      maxHeight: 700,
      compressFormat: ImageCompressFormat.jpg,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Sesuaikan KTP',
          toolbarColor: colorScheme.primary,
          toolbarWidgetColor: colorScheme.onPrimary,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: true,
          statusBarColor: colorScheme.primary,
          activeControlsWidgetColor: colorScheme.primary,
          hideBottomControls: true,
        ),
      ],
    );

    _scanResult(File(croppedImage!.path));
  }

  Future<void> _scanResult(File image) async {
    await ref.read(scannerControllerProvider.notifier).scan(image);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(scannerControllerProvider, (_, ScannerState state) {
      if (state is ScannerStateScanning) {
        Navigator.pushNamed(context, '/scan/result');
      }
    });

    final identityCards = ref.watch(identityCardNotifierProvider);

    final colorScheme = Theme.of(context).colorScheme;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      // transparent status bar
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ColoredBox(
              color: colorScheme.primary,
              child: SafeArea(
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Selamat Datang, ',
                            style: TextStyle(
                              fontSize: 20,
                              color: colorScheme.onPrimary,
                            ),
                          ),
                          Expanded(
                            child: Consumer(
                              builder: (context, ref, child) {
                                final username = ref.watch(
                                  userNotifierProvider.select(
                                    (state) => state.value?.name,
                                  ),
                                );

                                // print(FirebaseAuth.instance.currentUser);

                                return Text(
                                  '$username!',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: colorScheme.onPrimary,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                );
                              },
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/profile');
                            },
                            child: CircleAvatar(
                                radius: 28,
                                backgroundColor: Colors.white,
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 4,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 3,
                                    ),
                                  ),
                                  child: Consumer(
                                    builder: (context, ref, child) {
                                      final photoUrl = ref.watch(
                                        userNotifierProvider.select(
                                          (state) => state.value?.photoUrl,
                                        ),
                                      );

                                      final username = ref.watch(
                                        userNotifierProvider.select(
                                          (state) => state.value?.name,
                                        ),
                                      );

                                      if (photoUrl != null) {
                                        return CircleAvatar(
                                          radius: 28,
                                          backgroundColor: Colors.transparent,
                                          backgroundImage:
                                              NetworkImage(photoUrl),
                                          foregroundColor: Colors.white,
                                        );
                                      }

                                      // If there is no photoUrl, use initials of the username
                                      final initials = username != null &&
                                              username.isNotEmpty
                                          ? username
                                              .substring(0, 1)
                                              .toUpperCase()
                                          : '';

                                      return CircleAvatar(
                                        radius: 28,
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        child: Text(
                                          initials,
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24 + 32),
                  ],
                ),
              ),
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 20,
                  decoration: BoxDecoration(
                    color: colorScheme.primary,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
                Positioned(
                  top: -(98 / 2) + 18,
                  left: 16,
                  right: 16,
                  child: Container(
                    height: 98,
                    decoration: BoxDecoration(
                      color: colorScheme.background,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(0.05),
                          blurRadius: 20,
                          spreadRadius: 5,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Material(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                            child: InkWell(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                              onTap: () {
                                getImage(context);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.upload_file,
                                    color: colorScheme.primary,
                                    size: 30,
                                  ),
                                  const SizedBox(height: 8),
                                  const Text('Unggah KTP'),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Material(
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            child: InkWell(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              onTap: () {
                                Navigator.pushNamed(context, '/scan');
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.camera_alt,
                                    color: colorScheme.primary,
                                    size: 32,
                                  ),
                                  const SizedBox(height: 8),
                                  const Text('Scan KTP'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 92 / 2),
                child: identityCards.when(
                  data: (documents) => documents.isEmpty
                      ? _buildEmptyDocuments(context)
                      : _buildDocuments(documents),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  error: (error, _) => Center(
                    child: Text(error.toString()),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDocuments(List<IdentityCardModel> documents) {
    return RefreshIndicator(
      onRefresh: () async =>
          ref.read(identityCardNotifierProvider.notifier).refresh(),
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        itemCount: documents.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return const Padding(
              padding: EdgeInsets.only(
                left: 30.0,
                top: 24,
                bottom: 8.0,
              ),
              child: Text(
                'Riwayat',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            );
          }

          index -= 1;

          final document = documents[index];

          return Dismissible(
            key: ValueKey(document.id),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 24.0),
              child: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            confirmDismiss: (direction) async {
              final confirm = await showDialog<bool>(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Konfirmasi'),
                    content: const Text(
                      'Apakah anda yakin ingin menghapus data KTP ini?',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                        child: const Text('Batal'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, true);
                        },
                        child: const Text('Hapus'),
                      ),
                    ],
                  );
                },
              );

              if (confirm == null || !confirm) return false;

              return true;
            },
            onDismissed: (direction) async => ref
                .read(identityCardNotifierProvider.notifier)
                .delete(document),
            child: IdentityCardTile(
              document: document,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/detail',
                  arguments: document,
                );
              },
            ),
          );
        },
      ),
    );
  }

  Column _buildEmptyDocuments(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(
            left: 30.0,
            right: 30.0,
            top: 24,
          ),
          child: Text(
            'Riwayat',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/empty.gif',
                  width: 120,
                  height: 120,
                ),
                const SizedBox(height: 16),
                Text(
                  'Belum ada data KTP yang ditambahkan',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
