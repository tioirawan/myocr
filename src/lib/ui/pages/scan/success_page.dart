import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 3), () {
      Navigator.pop(context);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.primary,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/success.png',
              width: 200,
              height: 200,
            )
                .animate()
                .scaleXY(
                  begin: 20,
                  duration: 1.seconds,
                  curve: Curves.easeInOutCubic,
                )
                .fadeIn(
                  begin: 0.0,
                  duration: 1.seconds,
                  curve: Curves.easeInOutCubic,
                ),
            const SizedBox(height: 20),
            Text(
              'Berhasil Disimpan',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
            )
                .animate(
                  delay: 1.seconds,
                )
                .fadeIn()
                .slideY(),
            const SizedBox(height: 8),
            Text(
              'Data KTP Anda Berhasil Disimpan',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: colorScheme.onPrimary,
                  ),
            )
                .animate(
                  delay: 1.2.seconds,
                )
                .fadeIn()
                .slideY(),
          ],
        ),
      ),
    );
  }
}
