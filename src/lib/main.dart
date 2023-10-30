import 'package:flutter/material.dart';

import 'ui/pages/about_page.dart';
import 'ui/pages/auth/login_page.dart';
import 'ui/pages/auth/register_page.dart';
import 'ui/pages/dashboard_page.dart';
import 'ui/pages/detail_page.dart';
import 'ui/pages/edit_profile_page.dart';
import 'ui/pages/profile_page.dart';
import 'ui/pages/scan/camera_page.dart';
import 'ui/pages/scan/result_page.dart';
import 'ui/pages/scan/success_page.dart';
import 'ui/pages/splash_screen_page.dart';
import 'ui/themes/color_schemes.g.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
      ),
      themeMode: ThemeMode.light,
      initialRoute: '/profile',
      routes: {
        '/': (_) => const SplashScreenPage(),
        '/login': (_) => const LoginPage(),
        '/register': (_) => const RegisterPage(),
        '/dashboard': (_) => const DashboardPage(),
        '/detail': (_) => const DetailPage(),
        '/scan': (_) => const CameraPage(),
        '/scan/result': (_) => const ResultPage(),
        '/scan/success': (_) => const SuccessPage(),
        '/profile': (_) => const ProfilePage(),
        '/about': (_) => const AboutPage(),
        '/profile/edit': (_) => const EditProfilePage(),
      },
    );
  }
}
