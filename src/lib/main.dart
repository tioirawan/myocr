import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'domain/services/shared_preference_service.dart';
import 'firebase_options.dart';
import 'ui/pages/about_page.dart';
import 'ui/pages/auth/login_page.dart';
import 'ui/pages/auth/register_page.dart';
import 'ui/pages/cv_page.dart';
import 'ui/pages/dashboard_page.dart';
import 'ui/pages/detail_page.dart';
import 'ui/pages/edit_profile_page.dart';
import 'ui/pages/profile_page.dart';
import 'ui/pages/scan/camera_page.dart';
import 'ui/pages/scan/result_page.dart';
import 'ui/pages/scan/success_page.dart';
import 'ui/pages/splash_screen_page.dart';
import 'ui/providers/theme_mode_provider.dart';
import 'ui/themes/color_schemes.g.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode =
        ref.watch(themeModeNotifierProvider).value ?? ThemeMode.light;

    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
      ),
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      initialRoute: '/',
      routes: {
        '/': (_) => const SplashScreenPage(),
        '/login': (_) => const LoginPage(),
        '/register': (_) => const RegisterPage(),
        '/dashboard': (_) => const DashboardPage(),
        '/detail': (_) => const DetailPage(),
        '/scan': (_) => const CameraPage(),
        '/scan/result': (_) => const ResultPage(pageTitle: 'Hasil Scan KTP'),
        '/detail/edit': (_) => const ResultPage(pageTitle: 'Ubah KTP'),
        '/scan/success': (_) => const SuccessPage(),
        '/profile': (_) => const ProfilePage(),
        '/about': (_) => const AboutPage(),
        '/profile/edit': (_) => const EditProfilePage(),
        '/cv': (_) => const InputCvPage(),
      },
    );
  }
}
