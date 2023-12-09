import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/models/card_scanner_result_model.dart';
import '../../providers/scanner/scanner_controller_provider.dart';
import '../../providers/scanner/scanner_state.dart';
import '../../widgets/custom_scaffold.dart';
import 'result_form_field.dart';

class ResultPage extends ConsumerStatefulWidget {
  const ResultPage({super.key, required this.pageTitle});
  final String pageTitle;

  @override
  ConsumerState<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends ConsumerState<ResultPage> {
  late final TextEditingController _nikController,
      _nameController,
      _birthPlaceController,
      _birthDateController,
      _genderController,
      _bloodTypeController,
      _streetAddressController,
      _rtNumberController,
      _rwNumberController,
      _villageController,
      _subDistrictController,
      _districtController,
      _religionController,
      _maritalStatusController,
      _jobController,
      _nationalityController,
      _validUntilController;
  Uint8List? _croppedCard;
  Uint8List? _photo;

  @override
  void initState() {
    super.initState();

    _nikController = TextEditingController();
    _nameController = TextEditingController();
    _birthPlaceController = TextEditingController();
    _birthDateController = TextEditingController();
    _genderController = TextEditingController();
    _bloodTypeController = TextEditingController();
    _streetAddressController = TextEditingController();
    _rtNumberController = TextEditingController();
    _rwNumberController = TextEditingController();
    _villageController = TextEditingController();
    _subDistrictController = TextEditingController();
    _districtController = TextEditingController();
    _religionController = TextEditingController();
    _maritalStatusController = TextEditingController();
    _jobController = TextEditingController();
    _nationalityController = TextEditingController();
    _validUntilController = TextEditingController();
  }

  void updateValues(CardScannerResultModel? result) {
    final card = result?.identityCard;
    _croppedCard = result?.croppedImage;
    _photo = result?.photoImage;

    _nikController.text = card?.nik ?? _nikController.text;
    _nameController.text = card?.name ?? _nameController.text;
    _birthPlaceController.text = card?.birthPlace ?? _birthPlaceController.text;
    _birthDateController.text = card?.birthDate != null
        ? '${card?.birthDate?.day}-${card?.birthDate?.month}-${card?.birthDate?.year}'
        : _birthDateController.text;
    _genderController.text = card?.gender ?? _genderController.text;
    _bloodTypeController.text = card?.bloodType ?? _bloodTypeController.text;
    _streetAddressController.text =
        card?.streetAdress ?? _streetAddressController.text;
    _rtNumberController.text = card?.rtNumber ?? _rtNumberController.text;
    _rwNumberController.text = card?.rwNumber ?? _rwNumberController.text;
    _villageController.text = card?.village ?? _villageController.text;
    _subDistrictController.text =
        card?.subDistrict ?? _subDistrictController.text;
    _districtController.text = card?.district ?? _districtController.text;
    _religionController.text = card?.religion ?? _religionController.text;
    _maritalStatusController.text =
        card?.maritalStatus ?? _maritalStatusController.text;
    _jobController.text = card?.job ?? _jobController.text;
    _nationalityController.text =
        card?.nationality ?? _nationalityController.text;
    _validUntilController.text = card?.validUntil ?? _validUntilController.text;

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(scannerControllerProvider, (_, ScannerState state) {
      if (state is ScannerStateSuccess) {
        updateValues(state.result);
      } else if (state is ScannerStateError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.error),
          ),
        );
      } else if (state is ScannerStateNoImage) {
        Navigator.popAndPushNamed(context, '/scan');
      }
    });

    final scannerState = ref.watch(scannerControllerProvider);

    return CustomScaffold(
      body: Center(
        child: switch (scannerState) {
          ScannerStateScanning(image: var image) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Memindai KTP',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Harap tunggu, KTP Anda sedang dipindai\npada sistem super canggih kami',
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  if (image != null)
                    _buildLoadingAnimation(image)
                  else
                    const CircularProgressIndicator(),
                  const SizedBox(height: 24 * 2),
                ],
              ),
            ),
          ScannerStateSuccess() => _buildForm(context),
          ScannerStateError(error: var e) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error),
                  const SizedBox(height: 16),
                  Text(e),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(context, '/scan');
                    },
                    child: const Text('Kembali'),
                  ),
                ],
              ),
            ),
          ScannerStateNoImage() => const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error),
                  SizedBox(height: 16),
                  Text('No image'),
                ],
              ),
            ),
        },
      ),
    );
  }

  Padding _buildLoadingAnimation(File image) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color:
                  Theme.of(context).colorScheme.onBackground.withOpacity(0.2),
              blurRadius: 20,
              spreadRadius: 10,
            ),
          ],
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Image.file(image)
                  .animate(onComplete: (c) => c.repeat(reverse: true))
                  .custom(
                    duration: 2.seconds,
                    curve: Curves.easeInOut,
                    builder: (context, value, child) {
                      final scannerLightWidth = constraints.maxWidth / 2;
                      return Stack(
                        children: [
                          child,
                          Positioned(
                            top: 0,
                            bottom: 0,
                            width: scannerLightWidth,
                            left: value * constraints.maxWidth -
                                scannerLightWidth / 2,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.white.withOpacity(0.0),
                                    Theme.of(context)
                                        .colorScheme
                                        .onPrimary
                                        .withOpacity(0.5),
                                    Colors.white.withOpacity(0.0),
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            bottom: 0,
                            left: value * constraints.maxWidth - 5,
                            width: 10,
                            child: Container(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          )
                        ],
                      );
                    },
                  );
            },
          ),
        ),
      ),
    );
  }

  Form _buildForm(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppBar(
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            centerTitle: true,
            scrolledUnderElevation: 0,
            title: Text(
              widget.pageTitle,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const Divider(height: 0),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(24.0),
              shrinkWrap: true,
              children: [
                _buildKtpImage(context),
                _buildScannedPicture(context),
                ResultFormField(
                  title: 'NIK',
                  controller: _nikController,
                ),
                ResultFormField(
                  title: 'Nama',
                  controller: _nameController,
                ),
                ResultFormField(
                  title: 'Tempat Lahir',
                  controller: _birthPlaceController,
                ),
                ResultFormField(
                  title: 'Tanggal Lahir',
                  controller: _birthDateController,
                ),
                ResultFormField(
                  title: 'Jenis Kelamin',
                  controller: _genderController,
                ),
                ResultFormField(
                  title: 'Golongan Darah',
                  controller: _bloodTypeController,
                ),
                ResultFormField(
                  title: 'Alamat',
                  controller: _streetAddressController,
                ),
                ResultFormField(
                  title: 'RT',
                  controller: _rtNumberController,
                ),
                ResultFormField(
                  title: 'RW',
                  controller: _rwNumberController,
                ),
                ResultFormField(
                  title: 'Kelurahan/Desa',
                  controller: _villageController,
                ),
                ResultFormField(
                  title: 'Kecamatan',
                  controller: _subDistrictController,
                ),
                ResultFormField(
                  title: 'Kabupaten/Kota',
                  controller: _districtController,
                ),
                ResultFormField(
                  title: 'Agama',
                  controller: _religionController,
                ),
                ResultFormField(
                  title: 'Status Perkawinan',
                  controller: _maritalStatusController,
                ),
                ResultFormField(
                  title: 'Pekerjaan',
                  controller: _jobController,
                ),
                ResultFormField(
                    title: 'Kewarganegaraan',
                    controller: _nationalityController),
                ResultFormField(
                  title: 'Berlaku Hingga',
                  controller: _validUntilController,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
                foregroundColor: Theme.of(context).colorScheme.onSecondary,
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              onPressed: () {
                try {
                  Navigator.popAndPushNamed(context, '/scan/success');
                } catch (e) {
                  print('Error result page insert data: $e');
                }
              },
              child: const Text('Simpan'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKtpImage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: AspectRatio(
        aspectRatio: 1.6,
        child: _croppedCard != null
            ? Image.memory(
                _croppedCard!,
                fit: BoxFit.cover,
              )
            : Image.asset(
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
          Text(
            'Foto',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: 125,
            child: AspectRatio(
              aspectRatio: 3 / 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: _photo != null
                    ? Image.memory(
                        _photo!,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
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

  @override
  void dispose() {
    _nikController.dispose();
    _nameController.dispose();
    _birthPlaceController.dispose();
    _birthDateController.dispose();
    _genderController.dispose();
    _bloodTypeController.dispose();
    _streetAddressController.dispose();
    _rtNumberController.dispose();
    _rwNumberController.dispose();
    _villageController.dispose();
    _subDistrictController.dispose();
    _districtController.dispose();
    _religionController.dispose();
    _maritalStatusController.dispose();
    _jobController.dispose();
    _nationalityController.dispose();
    _validUntilController.dispose();

    super.dispose();
  }
}
