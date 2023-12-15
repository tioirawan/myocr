import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/custom_scaffold.dart';

enum OCRMethod { tesseract, google, myktp }

class OcrMethodScreenPage extends ConsumerStatefulWidget {
  const OcrMethodScreenPage({Key? key}) : super(key: key);

  @override
  ConsumerState<OcrMethodScreenPage> createState() => _OcrMethodPageState();
}

class _OcrMethodPageState extends ConsumerState<OcrMethodScreenPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
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
                    Navigator.of(context).pop(OCRMethod.tesseract);
                  },
                  child: Text(
                    'Tesseract OCR',
                    style: Theme.of(context).textTheme.labelLarge!.apply(
                          fontWeightDelta: 2,
                          color: Theme.of(context).colorScheme.onPrimary,
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
                    Navigator.of(context).pop(OCRMethod.google);
                  },
                  child: Text(
                    'Google ML Kit',
                    style: Theme.of(context).textTheme.labelLarge!.apply(
                          fontWeightDelta: 2,
                          color: Theme.of(context).colorScheme.onPrimary,
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
                    Navigator.of(context).pop(OCRMethod.myktp);
                  },
                  child: Text(
                    'myKTP OCR',
                    style: Theme.of(context).textTheme.labelLarge!.apply(
                          fontWeightDelta: 2,
                          color: Theme.of(context).colorScheme.onPrimary,
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
