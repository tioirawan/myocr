import 'package:flutter/material.dart';
import '../themes/color_schemes.g.dart';
import 'auth/login_page.dart';
import 'auth/register_page.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            const Spacer(),
            Image.network(
              'https://disdukcapil.kamparkab.go.id/wp-content/uploads/2019/05/ktp.png',
              width: 200,
              height: 200,
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.only(top: 90.0, bottom: 50.0, left: 50.0, right: 50),
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
                ]
              ),
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
                      'Permudah proses memindai KTP Anda dengan myKTP yang mudah dan aman.',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  InkWell(
                    child: Container(
                      margin: const EdgeInsets.only(top: 5.0),
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.black,
                          padding: const EdgeInsets.only(
                              top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (context) => const RegisterPage()));
                        },
                        child: const Text('Buat Akun',
                            style: TextStyle(fontSize: 16)),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const LoginPage()));
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
