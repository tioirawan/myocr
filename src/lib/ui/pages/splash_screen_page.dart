import 'package:flutter/material.dart';

import '../themes/color_schemes.g.dart';
import '../widgets/custom_scaffold.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          const Spacer(),
          Image.asset(
            'assets/images/logo.png',
            width: 225,
            height: 225,
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.only(
                top: 90.0, bottom: 50.0, left: 50.0, right: 50),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                ),
                color: lightColorScheme.primary,
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 2,
                    offset: const Offset(2, 2),
                    blurRadius: 5,
                    color: Colors.black.withOpacity(0.5),
                  )
                ]),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 24.0),
                  child: Text(
                    'Pindai, Kenali, dan Lindungi dengan myKTP',
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 55.0),
                  child: Text(
                    'Mempermudah Proses Pemindaian KTP Anda dengan Aman dan Mudah',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                InkWell(
                  child: Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.only(
                            top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/register');
                      },
                      child: const Text(
                        'Buat Akun',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed('/login');
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Text(
                      'Sudah punya akun? Masuk',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
