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
import '../themes/color_schemes.g.dart';

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
                          Text(
                            '${userData['name']}!',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: colorScheme.onPrimary,
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
                                  child: CircleAvatar(
                                    radius: 28,
                                    backgroundColor: Colors.transparent,
                                    backgroundImage:
                                        AssetImage(userData['profileImage']!),
                                    foregroundColor: Colors.white,
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
                          color: Colors.black.withOpacity(0.05),
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

          return _buildKTPCard(
            document,
            onTap: () {
              Navigator.pushNamed(
                context,
                '/detail',
                arguments: document,
              );
            },
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
                Icon(
                  Icons.hourglass_empty_rounded,
                  size: 64,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 16),
                Text(
                  'Belum ada data KTP\nyang ditambahkan',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildKTPCard(
    IdentityCardModel document, {
    VoidCallback? onTap,
  }) {
    // TODO: update this
    const isValid = true;

    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onTap,
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: document.cardImageUrl != null
                  ? Image.network(
                      document.cardImageUrl!,
                      fit: BoxFit.contain,
                    )
                  : Image.asset(
                      'assets/images/dummyktp.png',
                      fit: BoxFit.contain,
                    ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      document.name ?? '-',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${document.nik} - ${document.gender}',
                      style: const TextStyle(fontSize: 10),
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    // Action for the 'Unduh' button
                    print('Unduh button tapped');
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: lightColorScheme.primary,
                    minimumSize: const Size(20, 25),
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                  ),
                  child: const Text('Unduh', style: TextStyle(fontSize: 10)),
                ),
              ],
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 60,
                  height: 18,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isValid ? Colors.green : Colors.red,
                      width: 1,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      isValid ? 'Valid' : 'Tidak Valid',
                      style: TextStyle(
                        color: isValid ? Colors.green : Colors.red,
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Text(
                  document.createdAt?.toString() ?? '-',
                  style: const TextStyle(fontSize: 8),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
