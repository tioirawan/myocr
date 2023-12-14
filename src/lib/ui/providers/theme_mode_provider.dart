import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/services/shared_preference_service.dart';

part 'theme_mode_provider.g.dart';

@riverpod
class ThemeModeNotifier extends _$ThemeModeNotifier {
  @override
  FutureOr<ThemeMode> build() async {
    final sharedPreferences = ref.read(sharedPreferencesProvider);

    final themeMode = sharedPreferences.getString('themeMode');

    if (themeMode == 'ThemeMode.dark') {
      return ThemeMode.dark;
    } else {
      return ThemeMode.light;
    }
  }

  Future<void> setThemeMode(ThemeMode themeMode) async {
    final sharedPreferences = ref.read(sharedPreferencesProvider);

    await sharedPreferences.setString('themeMode', themeMode.toString());

    state = AsyncData(themeMode);
  }
}
