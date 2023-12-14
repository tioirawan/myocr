import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/user_model.dart';
import '../providers/user_provider.dart';
import '../widgets/custom_scaffold.dart';

class OcrScreenPage extends ConsumerStatefulWidget {
  const OcrScreenPage({Key? key}) : super(key: key);

  @override
  ConsumerState<OcrScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends ConsumerState<OcrScreenPage> {
  void _listenUser(_, AsyncValue<UserModel?> state) {
    state.maybeWhen(
      data: (user) {
        if (user != null) {
          Navigator.of(context).pushReplacementNamed('/dashboard');
        }
      },
      error: (e, st) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
          ),
        );
      },
      orElse: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(userNotifierProvider, _listenUser);
    return CustomScaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/chatbot.gif',
              width: 350,
              height: 350,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              bottom: 30.0, // Adjusted bottom padding
              left: 25,
              right: 25,
            ),
            child: Column(
              children: [
                // Add text above the "Buat Akun" button
                const Text(
                  'Ekstrak Data KTP Menggunakan',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 48),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/login');
                  },
                  child: Text(
                    'Tesseract OCR',
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
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 48),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/login');
                  },
                  child: Text(
                    'Google ML Kit',
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
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 48),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/login');
                  },
                  child: Text(
                    'myKTP OCR',
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
        ],
      ),
    );
  }
}
