import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';

import '../themes/color_schemes.g.dart';

class DashboardPage extends StatelessWidget {
  final Map<String, String> userData = const {
    'name': 'Putin',
    'profileImage': 'assets/images/profile.png',
  };

  final List<Map<String, dynamic>> documents = const [
    {
      'id': '1',
      'name': 'Vladimir Putin',
      'nik': '0034132142123',
      'gender': 'Laki-laki',
      'isValid': true,
      'lastAccessed': '20 Aug 2023, 08.00 PM',
    },
    {
      'id': '2',
      'name': 'Jane Smith',
      'nik': '0987654321',
      'gender': 'Perempuan',
      'isValid': false,
      'lastAccessed': '20 Jan 2023, 09.00 AM',
    },
    {
      'id': '3',
      'name': 'David Doe',
      'nik': '1245690784',
      'gender': 'Laki-laki',
      'isValid': true,
      'lastAccessed': '19 Jan 2023, 05.00 PM',
    },
    {
      'id': '4',
      'name': 'Salimah Hoe',
      'nik': '0987456445',
      'gender': 'Perempuan',
      'isValid': false,
      'lastAccessed': '22 Dec 2022, 10.00 AM',
    },
    {
      'id': '5',
      'name': 'Rusdi Smith',
      'nik': '1348675964',
      'gender': 'Laki-laki',
      'isValid': false,
      'lastAccessed': '22 Dec 2022, 08.00 AM',
    },
    {
      'id': '6',
      'name': 'Shanti Hwang',
      'nik': '0758999634',
      'gender': 'Perempuan',
      'isValid': true,
      'lastAccessed': '01 Dec 2022, 06.00 AM',
    },
  ];

  Future getImage() async {
    final ImagePicker picker = ImagePicker();

    // Meminta izin penyimpanan sebelum mengambil gambar
    var status = await Permission.storage.request();
    if (status != PermissionStatus.granted) {
      print('Izin tidak diberikan untuk mengakses penyimpanan.');
      return;
    }

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;

    // Menggunakan permision_handler untuk memeriksa izin penyimpanan
    final bool hasStoragePermission = await Permission.storage.isGranted;
    if (hasStoragePermission) {
      // Lanjutkan dengan operasi pengambilan gambar dan pemrosesan lainnya
    } else {
      print('Izin tidak diberikan untuk mengakses penyimpanan.');
    }
  }

  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                        onTap: () {
                          getImage();
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
                        InkWell(
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 92 / 2),
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
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        );
                      }

                      index -= 1;

                      final document = documents[index];

                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/detail',
                            arguments: document,
                          );
                        },
                        child: _buildKTPCard(
                          document['id'] as String,
                          document['name'] as String,
                          document['nik'] as String,
                          document['gender'] as String,
                          document['isValid'] as bool,
                          document['lastAccessed'] as String,
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKTPCard(
    String transactionID,
    String name,
    String nik,
    String gender,
    bool isValid,
    String lastAccessed,
  ) {
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
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        leading: ClipRRect(
          child: Image.asset(
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
                  name,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  '$nik - $gender',
                  style: const TextStyle(fontSize: 10),
                ),
                const SizedBox(height: 5),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                // Action for the 'Unduh' button
                print('Unduh button tapped for $nik');
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
              child: Center(
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
              lastAccessed,
              style: const TextStyle(fontSize: 8),
            ),
          ],
        ),
      ),
    );
  }
}
